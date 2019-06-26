package;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;

class Player extends FlxSprite
{
    private var _direction:Int;
    private var _velocity:Int;

    private var _bullets:FlxTypedGroup<Bullet>;

    public function new()
    {
        super();
        _direction = FlxObject.RIGHT;
        _velocity = 200;    
        this.health = 50;
        this.x = Std.random(FlxG.width);
        this.y = Std.random(FlxG.height);
        loadGraphic(AssetPaths.ship__png, false, 32, 32);   
        setFacingFlip(FlxObject.RIGHT, true, true);
        setFacingFlip(FlxObject.LEFT, true, true);
        setFacingFlip(FlxObject.UP, true, false);    
        setFacingFlip(FlxObject.DOWN, true, false);    
        
    }

    override public function update(e:Float) 
    {

        super.update(e);
    }

    public function startMoving(direction:Int) 
    {
        this.facing = direction;

        switch(direction)
        {
            case FlxObject.UP:
                this.velocity.y = -_velocity;
                this.velocity.x = 0;
            case FlxObject.DOWN:
                this.velocity.y = _velocity;
                this.velocity.x = 0;
            case FlxObject.RIGHT:
                this.velocity.x = _velocity;
                this.velocity.y = 0;
            case FlxObject.LEFT:
                this.velocity.x = -_velocity;                
                this.velocity.y = 0;
            default:
                FlxG.log.add("Invalid direction received");
        }    
    }

    public function stopMoving()
    {
        this.velocity.x = 0;
        this.velocity.y = 0;    
    }
}