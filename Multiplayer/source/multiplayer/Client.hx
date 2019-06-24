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
        super();
    }

    public function connect(serverIp:String, serverPort:Int)
    {
        _networkClient = Network.registerSession(NetworkMode.CLIENT, 
        {
            ip: serverIp,
            port: serverPort,
            flash_policy_file_url: 'http://'+ serverIp +':9999/crossdomain.xml'
        });

        _networkClient.addEventListener(NetworkEvent.MESSAGE_RECEIVED, function(event: NetworkEvent) 
        {
            try 
            {
                FlxG.log.add("[CLIENT] Event received from server " + event.data.opCode);            
                switch (event.data.opCode) 
                {
                    case GameEventTypes.PlayerIngressed :
                        handlePlayerIngression(cast(event.data, PlayerIngressedEvent));
                    case GameEventTypes.GameSync :
                        handleGameSync(cast(event.data, GameSyncEvent));
                    default :
                        trace("[CLIENT] Unhandled event type " + event.data.opCode);
                }
            }
            catch(e:String)
            {
                FlxG.log.add(event.data + " " + e);
            }
        });

        _networkClient = _networkClient.start();
    }

    private function handlePlayerIngression(event:PlayerIngressedEvent)
    {
        var playState = cast(FlxG.state, PlayState);
        playState.addPlayer(event.nickname, event.x, event.y);        
    }

    private function handleGameSync(event:GameSyncEvent)
    {
        var playState = cast(FlxG.state, PlayState);
        playState.sync(event.player);     
    }

    public static function getInstance():Client
    {
        if(_instance == null)
            _instance = new Client();

        return _instance;
    }

    public function sendIngressRequest(nickname:String) 
    {
        var requestEvent = new IngressRequestEvent(nickname);
        _networkClient.send(requestEvent);
        FlxG.log.add("[CLIENT] Requested to ingress server");
    }
}