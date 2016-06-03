package Pantallas
{
	import Models.EnemiesModel;
	import Models.PantallaModel;
	import Models.Play;
	import Models.TextosModel;
	
	import Partida.Game;
	import Partida.Settings;
	
	import Personajes.Enemigos.MagnetBombEnemy;
	import Personajes.Enemigos.MinionEnemy;
	import Personajes.Enemigos.PlayerBrain;
	import Personajes.Enemigos.SlimeEnemy;
	import Personajes.Enemigos.TorretaEnemy;
	import Personajes.Enemigos.ZubatEnemy;
	import Personajes.GarbageCollector;
	import Personajes.Hero.Hero;
	import Personajes.IA;
	
	import UI.Button.ButtonsHandler;
	import UI.Camera2D;
	import UI.CheckBox.CheckboxHandler;
	import UI.MiniMap;
	import UI.Textos.Textos;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	public class FuncionesPantallas
	{
		protected function resetearAudio(PantallaSonido:String,PantallaEjecutandose:int,pantalla:PantallaModel,settings:Settings):void
		{
			if(settings.Mutear == false)
			{
				pantalla.Audio = null;
				settings.Mutear = false;
			}
			pantalla.PantallaSonido = PantallaSonido;
			pantalla.PantallaEjecutandose = PantallaEjecutandose;
		}
		protected function iniciarPantallas(textosModel:TextosModel,game:Game,play:Play,idAudio:int,audio:String,spawnX:int,Nivel:MovieClip):String
		{
			var CheckUI:CheckboxHandler = new CheckboxHandler();
			CheckUI.sacarChecks(play.MiStage,play.ui);
			var BotonUI:ButtonsHandler = new ButtonsHandler();
			var Texto:Textos = new Textos();
			BotonUI.sacarBotones(play.MiStage,play.ui);
			//play.Niveles = Pantallas;
			//play.MiStage.addChild(play.Nivel1);
			//play.Nivel1.scaleX = 0.5;
			//play.Nivel1.scaleY = 0.5;
			
			//meter fondo aca XD
			BotonUI.agregarEscenario(0,0, new MC_FondoPantalla1,"FondoPantalla1",false,1,1,game,play);
			
			//play.hero.MyHero = new Hero(Keyboard.RIGHT, Keyboard.LEFT, Keyboard.W, Keyboard.E);
			play.hero.MyHero = new Hero(game.settings.Derecha, game.settings.Izquierda, game.settings.Arriba, game.settings.Disparo);
			play.hero.MyHero.Spawn(0,0,play.Pantalla.view);
			/*play.allBrains.push( new PlayerBrain(play.hero.MyHero, Keyboard.RIGHT, Keyboard.LEFT, Keyboard.W, Keyboard.E,
				game.stats.cantidadAltura,game.stats.cantidadVelocidad,play.MiStage) );*/
			play.allBrains.push( new PlayerBrain(play.hero.MyHero, game.settings.Derecha, game.settings.Izquierda, game.settings.Arriba, game.settings.Disparo,
			game.stats.cantidadAltura,game.stats.cantidadVelocidad,play.MiStage) );
			play.hero.VidaTotal = play.hero.VidaMaximaPersonaje + game.stats.cantidadVida - 1;
			play.hero.VidaPersonaje = play.hero.VidaMaximaPersonaje + game.stats.cantidadVida - 1;
			resetearAudio(audio,idAudio,play.Pantalla,game.settings);
			
			play.Pantalla.Camara = new Camera2D(play.MiStage,play.Pantalla.view);
			play.Pantalla.Camara.on();
			play.Pantalla.Camara.addToView(play.Pantalla.view);
			AgarrarTodo(play.Pantalla.view,play.Pantalla,Nivel,play.enemies);
			
			//Barra de HP
			play.hero.HPBar = new MC_HPBar;
			BotonUI.agregarBar(75,500, play.hero.HPBar,"HP",false,game,play);
			textosModel.TextoVida = Texto.dibujarTexto(play.hero.VidaPersonaje+"/"+play.hero.VidaTotal,200,200,50,490,play.MiStage);
			
			//Barra de EXP
			
			play.hero.ExpBar = new MC_EXPBar;
			BotonUI.agregarBar(250,500, play.hero.ExpBar,"EXP",false,game,play);
			textosModel.TextoExp = Texto.dibujarTexto("LVL:"+game.player.lvl+" EXP: "+game.player.exp+"/"+game.player.siguienteNivel,200,200,200,490,play.MiStage);
			play.hero.MyHero.updateExpBar(game.player.exp,game.player.siguienteNivel,play.hero.ExpBar);
			/*play.Pantalla.myMiniMap = new MiniMap(play.Pantalla.AllPisos, play);
			play.Pantalla.myMiniMap.x = 0;
			play.Pantalla.myMiniMap.y = play.Pantalla.view.height - play.Pantalla.myMiniMap.height;
			play.Pantalla.view.addChild(play.Pantalla.myMiniMap);*/
			//no va el zoom pero va
			//play.MiStage.addEventListener(MouseEvent.MOUSE_WHEEL, Callback.create(evZoom,play));
			
			return "Nada";
		}
		
		protected function evZoom(event:MouseEvent,play:Play):void
		{
			play.Pantalla.Camara.smoothZoom = play.Pantalla.Camara.zoom + event.delta / 25;
		}
		
		protected function evZoomOut(event:MouseEvent,play:Play):void
		{
			play.Pantalla.Camara.smoothZoom = play.Pantalla.Camara.zoom / 2;
		}
		
		protected function evZoomIn(event:MouseEvent,play:Play):void
		{
			play.Pantalla.Camara.smoothZoom = play.Pantalla.Camara.zoom * 2;
		}
		
		protected function UpdatePantalla(game:Game,play:Play,ia:IA):void
		{
			for(var I:int = play.allBrains.length -1; I >= 0; I--)
			{
				play.allBrains[I].Update(game.nivel.iDPantalla,game.settings,play);
			}
			ia.MoverEnemigos(play.enemies);
			var GC:GarbageCollector = new GarbageCollector();
			GC.EliminarEnemigos(1,game,play);
			GC.EliminarBalas(1,play.Pantalla.view,play);
			ia.ComprobarColisiones(game,play);
			ia.Heal(game,play);
			ia.Springo(play);
			ia.Finish(play);
			ia.Zubat(play,game);
			ia.Slime(play,game);
			ia.Minion(play,game);
			ia.Torreta(play,game);
			ia.Pinches(game,play);
			ia.MagnetBomb(play,game);
			ia.ColisionBalasEnemigos(play,game);
			play.Pantalla.Camara.lookAt(play.hero.MyHero.model.HitBox);
			//play.Pantalla.myMiniMap.update();
		}
		
		protected function LimpiarVariables(play:Play,game:Game):void
		{
			var I:int = 0;
			var GC:GarbageCollector = new GarbageCollector();
			GC.EliminarEnemigos(0,game,play);
			GC.EliminarBalas(0,play.Pantalla.view,play);
			play.hero.MyHero.Destroy(play.Pantalla.view);
			//Saco todos los elementos.
			play.allBrains.splice(0,play.allBrains.length);
			play.Pantalla.AllFinish.splice(0,play.Pantalla.AllFinish.length);
			play.Pantalla.AllHeal.splice(0,play.Pantalla.AllHeal.length);
			play.Pantalla.AllParedes.splice(0,play.Pantalla.AllParedes.length);
			play.Pantalla.AllPisos.splice(0,play.Pantalla.AllPisos.length);
			play.Pantalla.AllSpringo.splice(0,play.Pantalla.AllSpringo.length);
			play.enemies.AllZubat.splice(0,play.enemies.AllZubat.length);
			play.enemies.AllMinion.splice(0,play.enemies.AllMinion.length);
			play.enemies.AllSlime.splice(0,play.enemies.AllSlime.length);
			play.enemies.AllMagnetBomb.splice(0,play.enemies.AllMagnetBomb.length);
			play.enemies.AllTorreta.splice(0,play.enemies.AllTorreta.length);
			play.enemies.TodasBalas.splice(0,play.enemies.TodasBalas.length);
			//Fin Splices
			play.MiStage.removeChild(play.textosModel.TextoVida);
			play.MiStage.removeChild(play.hero.HPBar);
			play.enemies.EnemigosMatados = 0;
			play.MiStage.removeChild(play.Pantalla.view);
			play.FlagRecoil = 0;
			play.Timers.TimerRecoil = 0;
			play.Timers.TimerSpringo = 0;
			//Poner el TimerZubat en Timers XD
			play.Timers.TimerZubat = 0;
		}
		
		protected function AgarrarTodo(view:Sprite,pantalla:PantallaModel,Nivel:MovieClip,Enemies:EnemiesModel):void
		{		
			for(var i:int=0; i<Nivel.numChildren; i++)
			{
				switch(Nivel.getChildAt(i).name)
				{
					case "Piso":
					{
						pantalla.AllPisos.push(Nivel.getChildAt(i));
						break;
					}
					case "Pared":
					{
						pantalla.AllParedes.push(Nivel.getChildAt(i));
						break;
					}
					case "Heal":
					{
						pantalla.AllHeal.push(Nivel.getChildAt(i));
						break;
					}
					case "Springo":
					{
						pantalla.AllSpringo.push(Nivel.getChildAt(i));
						break;
					}
					case "Pinches":
					{
						pantalla.AllPinches.push(Nivel.getChildAt(i));
						break;
					}
					case "Finish":
					{
						pantalla.AllFinish.push(Nivel.getChildAt(i));
						break;
					}
					case "Zubat":
					{
						Enemies.models.push(Nivel.getChildAt(i));
						Enemies.AllZubat.push(new ZubatEnemy(Enemies.models[Enemies.models.length-1]));
						break;
					}
					case "Minion":
					{
						Enemies.models.push(Nivel.getChildAt(i));
						Enemies.AllMinion.push(new MinionEnemy(Enemies.models[Enemies.models.length-1]));
						break;
					}
					case "Slime":
					{
						Enemies.models.push(Nivel.getChildAt(i));
						Enemies.AllSlime.push(new SlimeEnemy(Enemies.models[Enemies.models.length-1]));
						break;
					}
					case "Torreta":
					{
						Enemies.models.push(Nivel.getChildAt(i));
						Enemies.AllTorreta.push(new TorretaEnemy(Enemies.models[Enemies.models.length-1]));
						break;
					}
					case "MagnetBomb":
					{
						Enemies.models.push(Nivel.getChildAt(i));
						Enemies.AllMagnetBomb.push(new MagnetBombEnemy(Enemies.models[Enemies.models.length-1]));
						break;
					}
				}
			}
			Enemies.models.splice(0,Enemies.models.length);
		}
	}
}