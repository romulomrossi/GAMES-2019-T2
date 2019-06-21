package;
import sys.ssl.Key;
import flixel.input.keyboard.FlxKey;
import flixel.input.keyboard.FlxKeyboard;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
    public var nickname:String;
    private var _direction:String;
    private var _velocity:Int = 60;

    private var _isLocal:Bool;

    public function new(isLocal:Bool) 
    {
        _isLocal = isLocal;
        super();
    }

    public override function update(e:Float) 
    {
        if(_isLocal)
            handleKeyBoard();

        super.update(e);
    }

    private function handleKeyBoard()
    {
        if(FlxG.keys.justPressed.DOWN)
        {
            this.velocity.y = _velocity;
            _direction = "DOWN";  
        }    

        if(FlxG.keys.justReleased.DOWN)
        {
            this.velocity.y = 0;
        }

        if(FlxG.keys.justPressed.UP)
        {
            this.velocity.y = -_velocity;
            _direction = "UP";  
        }    

        if(FlxG.keys.justReleased.UP)
        {
            this.velocity.y = 0;
        }

        if(FlxG.keys.justPressed.RIGHT)
        {
            this.velocity.x = _velocity;
            _direction = "Right";  
        }    

        if(FlxG.keys.justReleased.RIGHT)
        {
            this.velocity.x = 0;
        }

        if(FlxG.keys.justPressed.LEFT)
        {
            this.velocity.x = -_velocity;
            _direction = "Left";  
        }    

        if(FlxG.keys.justReleased.LEFT)
        {
            this.velocity.x = 0;
        }
    }
}