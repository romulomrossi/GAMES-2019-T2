package;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKeyboard;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
    private var _direction:String;
    private var _velocity:Int;

    private var _bullets:FlxTypedGroup<Bullet>;

    public function new()
    {
        _direction = "RIGHT";
        _velocity = 100;    

        super();
    }

    override public function update(e:Float) 
    {
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
            this.velocity.y -= _velocity;
        }

        if(FlxG.keys.justPressed.UP)
        {
            this.velocity.y = -_velocity;
            _direction = "UP";  
        }    

        if(FlxG.keys.justReleased.UP)
        {
            this.velocity.y += _velocity;
        }

        if(FlxG.keys.justPressed.RIGHT)
        {
            this.velocity.x = _velocity;
            _direction = "RIGHT";  
        }    

        if(FlxG.keys.justReleased.RIGHT)
        {
            this.velocity.x -= _velocity;
        }

        if(FlxG.keys.justPressed.LEFT)
        {
            this.velocity.x = -_velocity;
            _direction = "LEFT";  
        }    

        if(FlxG.keys.justReleased.LEFT)
        {
            this.velocity.x += _velocity;
        }
    }
}