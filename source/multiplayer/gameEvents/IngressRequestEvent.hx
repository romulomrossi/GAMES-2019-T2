package multiplayer.gameEvents;

class IngressRequestEvent extends GameEvent
{
    public var nickname:String;
    public var serverPort:Int; 
    public var serverIp:String;

    public function new(nickname:String, serverIp:String, serverPort:Int) 
    {
        opCode = GameEventTypes.IngressRequest;
 
        this.nickname = nickname;
        this.serverPort = serverPort;
        this.serverIp = serverIp;
    }
}