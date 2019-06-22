package multiplayer;

import haxe.Timer;
import networking.sessions.items.ClientObject;
import networking.sessions.Session;
import networking.Network;
import networking.utils.NetworkEvent;
import networking.utils.NetworkMode;
import openfl.display.Sprite;
import flixel.FlxG;
import multiplayer.gameEvents.*;


class Server extends Sprite 
{
	private static var _instance:Server = null;

	private var _networkServer:Session;

	private function new() 
	{
		super();
	}

	public static function getInstance():Server 
	{
		if (_instance == null)
			_instance = new Server();

		return _instance;
	}

	public function run(port:Int) 
	{
		var server = Network.registerSession(NetworkMode.SERVER, {
			ip: '0.0.0.0',
			port: port,
			flash_policy_file_port: 9999
		});

		// When a client is connected...
		server.addEventListener(NetworkEvent.CONNECTED, function(event:NetworkEvent) 
		{
			
			FlxG.log.add("[SERVER] Client " + event.client.uuid + " ingressed to network");
		});

		// When recieving a message from a client...
		server.addEventListener(NetworkEvent.MESSAGE_RECEIVED, function(event:NetworkEvent) 
		{
			try 
			{
				FlxG.log.add("[SERVER] Event " + event.data.opCode + " received from " + event.client.uuid);
				
				switch (event.data.opCode) 
				{
					case GameEventTypes.IngressRequest:
						handleIngress(event.client, cast(event.data, IngressRequestEvent));
					default:
						trace("[SERVER] Unhandled event type " + event.data.opCode);
				}
			} 
			catch (e:String) 
			{
				FlxG.log.add("[SERVER] Invalid event received from " + event.client.uuid + "! Error: " + e);
			}
		});

		server.start();

		_networkServer = server;
	}

	//Handle ingress request
	private function handleIngress(sender:ClientObject, event:IngressRequestEvent):Void 
	{
		//Synchronize current players with the incoming 
		var playState = cast(FlxG.state, PlayState);
		for(p in playState.getPlayers())
			sender.send(new GameSyncEvent(p));

		//Broadcast new player ingression
		var ingressedEvent = new PlayerIngressedEvent(event.nickname);
		for(client in _networkServer.clients)
		{
			var success = client.send(ingressedEvent);
			if(success == false)
				FlxG.log.add("Failed to send message");
		}
	}
}
