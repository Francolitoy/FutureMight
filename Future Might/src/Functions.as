package
{
	import Models.Play;
	import Pantallas.Funcionalidades.Pausa;
	import Partida.Game;
	import Partida.Nivel;
	import Partida.Player;
	import Partida.Spend;
	import Partida.Stats;
	import Personajes.Hero.Hero;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Functions extends Sprite
	{
		internal function SoltarTecla(event:KeyboardEvent,game:Game,play:Play):void
		{
			switch(event.keyCode)
			{
				case Keyboard.M:
					if(game.settings.Mutear)
					{
						game.settings.Mutear = false;
					}
					else
					{
						game.settings.Mutear = true;
					}
					play.cambios = true;
					break;
				
				case Keyboard.UP:
					if(play.cheats.KonamiCode <= 1)
					{
						play.cheats.KonamiCode = play.cheats.KonamiCode + 1;
					}
					else
					{
						play.cheats.KonamiCode = 0;
					}
					break;
				case Keyboard.DOWN:
					if(play.cheats.KonamiCode == 2 || play.cheats.KonamiCode == 3)
					{
						play.cheats.KonamiCode = play.cheats.KonamiCode + 1;
					}
					else
					{
						play.cheats.KonamiCode = 0;
					}
					break;
				case Keyboard.LEFT:
					if(play.cheats.KonamiCode == 4 || play.cheats.KonamiCode == 6)
					{
						play.cheats.KonamiCode = play.cheats.KonamiCode + 1;
					}
					else
					{
						play.cheats.KonamiCode = 0;
					}
					break;
				case Keyboard.RIGHT:
					if(play.cheats.KonamiCode == 5 || play.cheats.KonamiCode == 7)
					{
						play.cheats.KonamiCode = play.cheats.KonamiCode + 1;
					}
					else
					{
						play.cheats.KonamiCode = 0;
					}
					break;
				case Keyboard.B:
					if(play.cheats.KonamiCode == 8)
					{
						play.cheats.KonamiCode = play.cheats.KonamiCode + 1;
					}
					else
					{
						play.cheats.KonamiCode = 0;
					}
					break;
				case Keyboard.A:
					if(play.cheats.KonamiCode == 9)
					{
						game.nivel.iDPantalla = 9;
						game.stats.cantidadAtaque = 1;
						game.stats.cantidadVida = 6;
						game.stats.cantidadAltura = 3;
						game.stats.cantidadVelocidad = 13;
						game.player.dinero = 999999;
						play.cheats.Creditos = 1;
					}
					break;
				case Keyboard.ESCAPE:
				{
					var pausa:Pausa = new Pausa();
					if (play.pause) 
					{
						pausa.destroy(play);
					}
					else
					{
						pausa.init(game,play);
					}
					/*if (play.Pantalla.PantallaEjecutandose != -2) 
					{
						if (play.MiStage.frameRate < 1) 
						{
							play.MiStage.frameRate = 60;
						}
						else
						{
							var pausa:Pausa = new Pausa();
							pausa.init(game,play);
							play.MiStage.frameRate = 0;
						}
					}*/
					break;
				}
			}
		}
	}
}