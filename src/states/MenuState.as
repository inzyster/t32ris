package states
{

	import display.Color;
	import org.flixel.*;
	import states.BaseState;
	import states.PlayState;
	import display.tetrominos.Tetromino;
	import display.tetrominos.TetrominoType;
	import utils.Utils;

	public class MenuState extends BaseState
	{
		
		private var _enter:FlxText;
		private var _elapsed:Number;
		
		override public function create():void
		{
			super.create();
			
			this.add(new FlxText(-1, -1, FlxG.width, "SYN", true).setFormat("5fb", 4, Color.White.RGBValue, "left"));
			this.add(new FlxText(-2, 5, FlxG.width, "TET", true).setFormat("5fb", 4, Color.LightGray.RGBValue, "center"));
			this.add(new FlxText(1, 11, FlxG.width, "RIS", true).setFormat("5fb", 4, Color.LightGray.RGBValue, "right"));
			this.add(_enter = new FlxText(-1, 22, FlxG.width, "Enter", true).setFormat("04B", 8, Color.Gray.RGBValue, "center"));
						
			_elapsed = 0.0;
		}
		
		override public function update():void
		{
			super.update();	
			
			if (FlxG.keys.ENTER)
			{
				FlxG.switchState(new PlayState());
				return;
			}
			_elapsed += FlxG.elapsed;
			
			_enter.color = (0xff000000 | Utils.BlendRGB(Color.LightGray.RGBValue, Color.Gray.RGBValue, (Math.sin(_elapsed * 2.0) + 1.0) / 2.0));
		}						
		
	}
}

