package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:sizei2114y4:typey5:MUSICy2:idy26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR4y26:flixel%2Fsounds%2Fbeep.ogghy7:preloadtgoR0i39706R1R2R3y28:flixel%2Fsounds%2Fflixel.mp3R5aR8y28:flixel%2Fsounds%2Fflixel.ogghR7tgoR0i5794R1y5:SOUNDR3R6R5aR4R6hgoR0i33629R1R10R3R9R5aR8R9hgoR0i15744R1y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR3y30:flixel%2Ffonts%2Fnokiafc22.ttfR7tgoR0i29724R1R11R12y36:__ASSET__flixel_fonts_monsterrat_ttfR3y31:flixel%2Ffonts%2Fmonsterrat.ttfR7tgoy4:pathy33:flixel%2Fimages%2Fui%2Fbutton.pngR0i519R1y5:IMAGER3R18R7tgoR17y36:flixel%2Fimages%2Flogo%2Fdefault.pngR0i3280R1R19R3R20R7tgoR17y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR0i912R1R19R3R21R7tgoR17y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR0i433R1R19R3R22R7tgoR17y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR0i446R1R19R3R23R7tgoR17y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR0i459R1R19R3R24R7tgoR17y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR0i511R1R19R3R25R7tgoR17y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR0i493R1R19R3R26R7tgoR17y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR0i247R1R19R3R27R7tgoR17y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR0i534R1R19R3R28R7tgoR17y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR0i922R1R19R3R29R7tgoR17y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR0i946R1R19R3R30R7tgoR17y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR0i253R1R19R3R31R7tgoR17y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR0i212R1R19R3R32R7tgoR17y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR0i192R1R19R3R33R7tgoR17y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR0i214R1R19R3R34R7tgoR17y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR0i156R1R19R3R35R7tgoR17y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR0i1724R1R19R3R36R7tgoR17y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR0i294R1R19R3R37R7tgoR17y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR0i129R1R19R3R38R7tgoR17y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR0i128R1R19R3R39R7tgoR17y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR0i136R1R19R3R40R7tgoR17y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR0i147R1R19R3R41R7tgoR17y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR0i191R1R19R3R42R7tgoR17y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR0i153R1R19R3R43R7tgoR17y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR0i185R1R19R3R44R7tgoR17y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR0i201R1R19R3R45R7tgoR17y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR0i210R1R19R3R46R7tgoR17y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR0i18509R1R19R3R47R7tgoR17y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR0i1263R1y4:TEXTR3R48R7tgoR17y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR0i1953R1R49R3R50R7tgoR17y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR0i1848R1R49R3R51R7tgoR17y25:assets%2Fdata%2Fdemo1.fgrR0i114972R1R49R3R52R7tgoR17y25:assets%2Fdata%2Fdemo2.fgrR0i72188R1R49R3R53R7tgoR17y25:assets%2Fimages%2Fbot.pngR0i1309R1R19R3R54R7tgoR17y32:assets%2Fimages%2Fbot_bullet.pngR0i176R1R19R3R55R7tgoR17y28:assets%2Fimages%2Fbullet.pngR0i223R1R19R3R56R7tgoR17y28:assets%2Fimages%2Fcursor.pngR0i180R1R19R3R57R7tgoR17y26:assets%2Fimages%2Fdirt.pngR0i193R1R19R3R58R7tgoR17y30:assets%2Fimages%2Fdirt_top.pngR0i162R1R19R3R59R7tgoR17y26:assets%2Fimages%2Fgibs.pngR0i3630R1R19R3R60R7tgoR17y31:assets%2Fimages%2Fimg_tiles.pngR0i600R1R19R3R61R7tgoR17y25:assets%2Fimages%2Fjet.pngR0i162R1R19R3R62R7tgoR17y31:assets%2Fimages%2Fminiframe.pngR0i169R1R19R3R63R7tgoR17y30:assets%2Fimages%2Fspaceman.pngR0i3725R1R19R3R64R7tgoR17y29:assets%2Fimages%2Fspawner.pngR0i508R1R19R3R65R7tgoR17y34:assets%2Fimages%2Fspawner_gibs.pngR0i226R1R19R3R66R7tgoR17y32:assets%2Fimages%2Ftech_tiles.pngR0i184R1R19R3R67R7tgoR0i7966R1R2R3y29:assets%2Fsounds%2Fasplode.mp3R5aR68y29:assets%2Fsounds%2Fasplode.ogghR7tgoR0i2114R1R2R3y28:assets%2Fsounds%2Fbutton.mp3R5aR70y28:assets%2Fsounds%2Fbutton.ogghR7tgoR0i2532R1R2R3y31:assets%2Fsounds%2Fcountdown.mp3R5aR72y31:assets%2Fsounds%2Fcountdown.ogghR7tgoR0i6659R1R2R3y27:assets%2Fsounds%2Fenemy.mp3R5aR74y27:assets%2Fsounds%2Fenemy.ogghR7tgoR0i5040R1R2R3y25:assets%2Fsounds%2Fhit.mp3R5aR76y25:assets%2Fsounds%2Fhit.ogghR7tgoR0i4204R1R2R3y26:assets%2Fsounds%2Fhurt.mp3R5aR78y26:assets%2Fsounds%2Fhurt.ogghR7tgoR0i2533R1R2R3y25:assets%2Fsounds%2Fjam.mp3R5aR80y25:assets%2Fsounds%2Fjam.ogghR7tgoR0i7130R1R2R3y25:assets%2Fsounds%2Fjet.mp3R5aR82y25:assets%2Fsounds%2Fjet.ogghR7tgoR0i2114R1R2R3y26:assets%2Fsounds%2Fjump.mp3R5aR84y26:assets%2Fsounds%2Fjump.ogghR7tgoR0i20923R1R2R3y30:assets%2Fsounds%2Fmenu_hit.mp3R5aR86y30:assets%2Fsounds%2Fmenu_hit.ogghR7tgoR0i19251R1R2R3y32:assets%2Fsounds%2Fmenu_hit_2.mp3R5aR88y32:assets%2Fsounds%2Fmenu_hit_2.ogghR7tgoR0i139597R1R2R3y26:assets%2Fsounds%2Fmode.mp3R5aR90y26:assets%2Fsounds%2Fmode.ogghR7tgoR0i2114R1R2R3y27:assets%2Fsounds%2Fshoot.mp3R5aR92y27:assets%2Fsounds%2Fshoot.ogghR7tgoR0i8023R1R10R3R69R5aR68R69hgoR0i4646R1R10R3R71R5aR70R71hgoR0i4946R1R10R3R73R5aR72R73hgoR0i5565R1R10R3R75R5aR74R75hgoR0i6307R1R10R3R77R5aR76R77hgoR0i6065R1R10R3R79R5aR78R79hgoR0i4642R1R10R3R81R5aR80R81hgoR0i7654R1R10R3R83R5aR82R83hgoR0i4733R1R10R3R85R5aR84R85hgoR0i15343R1R10R3R87R5aR86R87hgoR0i13626R1R10R3R89R5aR88R89hgoR0i81299R1R10R3R91R5aR90R91hgoR0i4165R1R10R3R93R5aR92R93hgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_demo1_fgr extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_demo2_fgr extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bot_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dirt_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dirt_top_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_img_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_jet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_miniframe_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spaceman_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spawner_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spawner_gibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tech_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_asplode_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_button_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_countdown_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_enemy_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hit_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jam_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jet_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_mode_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shoot_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_asplode_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_button_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_countdown_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_enemy_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hit_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hurt_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jam_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jet_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_mode_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shoot_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,3,2/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("assets/data/demo1.fgr") @:noCompletion #if display private #end class __ASSET__assets_data_demo1_fgr extends haxe.io.Bytes {}
@:keep @:file("assets/data/demo2.fgr") @:noCompletion #if display private #end class __ASSET__assets_data_demo2_fgr extends haxe.io.Bytes {}
@:keep @:image("assets/images/bot.png") @:noCompletion #if display private #end class __ASSET__assets_images_bot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bot_bullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_bot_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dirt.png") @:noCompletion #if display private #end class __ASSET__assets_images_dirt_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dirt_top.png") @:noCompletion #if display private #end class __ASSET__assets_images_dirt_top_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gibs.png") @:noCompletion #if display private #end class __ASSET__assets_images_gibs_png extends lime.graphics.Image {}
@:keep @:image("assets/images/img_tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_img_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/jet.png") @:noCompletion #if display private #end class __ASSET__assets_images_jet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/miniframe.png") @:noCompletion #if display private #end class __ASSET__assets_images_miniframe_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spaceman.png") @:noCompletion #if display private #end class __ASSET__assets_images_spaceman_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spawner.png") @:noCompletion #if display private #end class __ASSET__assets_images_spawner_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spawner_gibs.png") @:noCompletion #if display private #end class __ASSET__assets_images_spawner_gibs_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tech_tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tech_tiles_png extends lime.graphics.Image {}
@:keep @:file("assets/sounds/asplode.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_asplode_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/button.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_button_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/countdown.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_countdown_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/enemy.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_enemy_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hit.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_hit_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hurt.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jam.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_jam_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jet.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_jet_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jump.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit_2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mode.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_mode_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/shoot.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_shoot_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/asplode.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_asplode_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/button.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_button_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/countdown.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_countdown_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/enemy.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_enemy_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hit.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_hit_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/hurt.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_hurt_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jam.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_jam_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jet.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_jet_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jump.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/menu_hit_2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_hit_2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mode.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_mode_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/shoot.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_shoot_ogg extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
