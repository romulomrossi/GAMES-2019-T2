package multiplayer.gameEvents;

class PlayerIngressedEvent extends GameEvent
{
    public var x:Float;
    public var y:Float;

    public var nickname:String;
    public var serverPort:Int;
    public var serverIp:String;

    public function new(nickname:String, serverIp:String, serverPort:Int) 
    {
        opCode = GameEventTypes.PlayerIngressed;

        this.nickname = nickname;
        this.serverIp = serverIp;
        this.serverPort = serverPort;
    }    
}