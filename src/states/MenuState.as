package states
{

	import display.Color;
	import org.flixel.*;
	import states.BaseState;
	import states.PlayState;
	import display.tetrominos.Tetromino;
	import display.tetrominos.TetrominoType;

	public class MenuState extends BaseState
	{
		
		private var playButton:FlxButton;
		private var devButton:FlxButton;
		private var Title:FlxText;
		
		override public function create():void
		{
			super.create();
			
			this.add(new FlxText(0, -1, FlxG.width, "T32RIS", true).setFormat("TooSimple", 4, Color.White.RGBValue, "left"));
			this.add(new FlxText(0, 8, FlxG.width, "Arrows", true).setFormat("TooSimple", 4, Color.LightGray.RGBValue, "left"));
			this.add(new FlxText(0, 15, FlxG.width, "and", true).setFormat("TooSimple", 4, Color.LightGray.RGBValue, "left"));
			this.add(new FlxText(0, 22, FlxG.width, "Enter", true).setFormat("04B", 8, Color.Gray.RGBValue, "left"));
									
		}
		
		override public function update():void
		{
			super.update();	
			
			if (FlxG.keys.ENTER)
			{
				FlxG.switchState(new PlayState());
			}
		}						
		
	}
}

