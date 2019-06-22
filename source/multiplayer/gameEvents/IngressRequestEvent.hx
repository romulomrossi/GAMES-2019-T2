package multiplayer.gameEvents;

class IngressRequestEvent extends GameEvent
{
    public var nickname:String;

    public function new(nickname:String) 
    {
        opCode = GameEventTypes.IngressRequest;
 
        this.nickname = nickname;
    }
}