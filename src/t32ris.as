package
{

	import data.Registry;
	import org.flixel.*;
	import states.MenuState;
	[SWF(width="640", height="640", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	public class t32ris extends FlxGame
	{

		public function t32ris()
		{
			Registry.initialize();
			
			super(32, 32, MenuState, 20, 60, 60);
			forceDebugger = true;
		}

	}

}

