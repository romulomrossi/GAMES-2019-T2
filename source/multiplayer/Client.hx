package multiplayer;

import multiplayer.gameEvents.GameEventTypes;
import networking.utils.NetworkEvent;
import multiplayer.gameEvents.IngressRequestEvent;
import multiplayer.gameEvents.*;
import flixel.FlxSprite;
import networking.Network;
import networking.utils.NetworkMode;
import networking.sessions.Session;
import flixel.FlxG;

class Client extends FlxSprite
{
    var _networkClient:Session;
    static var _instance:Client;

    private function new()
    {
        _networkClient = Network.registerSession(NetworkMode.CLIENT, 
        {
            ip: "127.0.0.1",
            port: 8000,
            flash_policy_file_url: 'http://127.0.0.1:9999/crossdomain.xml'
        });

        _networkClient.addEventListener(NetworkEvent.MESSAGE_RECEIVED, function(event: NetworkEvent) 
        {
            FlxG.log.add("[CLIENT] Event received from server " + event.data.opCode);            
			switch (event.data.opCode) 
            {
                case GameEventTypes.PlayerIngressed :
                    handlePlayerIngression(cast(event.data, PlayerIngressedEvent));
                default :
                    trace("[CLIENT] Unhandled event type " + event.data.opCode);
			}
        });

        _networkClient.start();

        super();
    }

    private function handlePlayerIngression(event:PlayerIngressedEvent)
    {
        var playState = cast(FlxG.state, PlayState);
        playState.addPlayer(event.nickname, event.x, event.y);        
    }

    public static function getInstance():Client
    {
        if(_instance == null)
            _instance = new Client();

        return _instance;
    }

    public function sendIngressRequest(nickname:String, localServerIp:String, localServerPort:Int) 
    {
        var requestEvent = new IngressRequestEvent(nickname, localServerIp, localServerPort);
        _instance._networkClient.send(requestEvent);
    
        FlxG.log.add("[CLIENT] Requested to ingress server");
    }
}