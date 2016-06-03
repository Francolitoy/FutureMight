package Personajes
{
	import Models.EnemiesModel;
	import Models.Play;
	
	import Partida.Game;
	
	import Personajes.Enemigos.ZubatEnemy;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import Personajes.Enemigos.BalasDeEnemies;
	import Personajes.Enemigos.MagnetBombEnemy;
	import Personajes.Enemigos.MinionEnemy;
	import Personajes.Enemigos.SlimeEnemy;
	import Personajes.Enemigos.TorretaEnemy;
	import Personajes.Enemigos.ZubatEnemy;
	import Personajes.Hero.BalasDeHero;
	import Personajes.Hero.Hero;

	public class IA
	{
		//esta mierda es del Flyer XD
		public function MoverEnemigos(enemies:EnemiesModel):void
		{
			for(var I:int = enemies.Enemigos.length -1; I >= 0; I--)
			{
				enemies.Enemigos[I].Moverse();
			}
		}
		
		public function MoverDisparoEnemigos(play:Play):void
		{
			for(var I:int = play.enemies.TodasBalas.length-1; I >= 0; I--)
			{
				play.enemies.TodasBalas[I].Update();
			}
		}
		
		public function GenerarDisparoEnemigos(play:Play):void
		{
			for(var I:int = play.enemies.Enemigos.length -1; I >= 0; I--)
			{
				play.enemies.Enemigos[I].Disparar(play.hero.MyHero.model.x,play.hero.MyHero.model.y,play.MiStage);
			}
		}
		
		public function ComprobarColisiones(game:Game,play:Play):void
		{
			var FlagParedes:Boolean = false;
			var FlagPiso:Boolean = false;			
			if(play.FlagRecoil == 1 || play.FlagInvencibilidad == 1)
			{
				for each (var pared:MovieClip in play.Pantalla.AllParedes) 
				{
					if(play.hero.MyHero.model.Espalda.hitTestObject(pared))
					{
						FlagParedes = true;
					}
				}
				
				for each (var piso:MovieClip in play.Pantalla.AllPisos) 
				{
					if(play.hero.MyHero.model.Espalda.hitTestObject(piso))
					{
						FlagPiso = true;
					}
				}
				
				if (!FlagParedes && !FlagPiso) 
				{
					play.hero.MyHero.model.x = play.hero.MyHero.model.x -1.7 * play.hero.MyHero.Dir;
				}				
				
				//play.hero.MyHero.model.y = play.hero.MyHero.model.y -7 * play.hero.MyHero.Dir; es el weee XD
				if (play.FlagRecoil == 1) 
				{
					play.Timers.TimerRecoil = play.Timers.TimerRecoil + 1;
				}
				play.Timers.TimerInvencibilidad = play.Timers.TimerInvencibilidad + 1;
				if(play.Timers.TimerRecoil > 30)
				{
					play.FlagRecoil = 0;
					play.Timers.TimerRecoil = 0;
				}
				if(play.Timers.TimerInvencibilidad > 60)
				{
					play.FlagInvencibilidad = 0;
					play.Timers.TimerInvencibilidad = 0;
				}
			}
			
			
			
			var i:int = 0;
			for each (var bala:BalasDeHero in Hero.TodasBalas) 
			{
				var j:int = 0;
				for each (var zub:ZubatEnemy in play.enemies.AllZubat) 
				{
					
					if(bala.model != null && zub.model != null)
					{
						if(bala.model.hitTestObject(zub.model.hitArea))
						{
							zub.Vida = zub.Vida - game.stats.cantidadAtaque;
							ExplosionBalas(play,bala.model.x,bala.model.y);
							Hero.TodasBalas.splice(i,1);
							play.Pantalla.view.removeChild(bala.model);
							if(zub.Vida <= 0)
							{
								eliminarEnemy(play,zub.model,j,bala.model);
								game.bestiario.zubat = true;
								play.enemies.AllZubat.splice(j,1);
								updateExpBar(game,play,zub.exp);
							}
							return;
						}
					}
					/*zub.Vida = comprobarEnemigos(bala.model,zub.model,zub.Vida,game,play,j,i);
					return;*/
					j++;
				}
				j = 0;
				for each (var slime:SlimeEnemy in play.enemies.AllSlime) 
				{
					if(bala.model != null && slime.model != null)
					{
						if(bala.model.hitTestObject(slime.model))
						{
							slime.Vida = slime.Vida - game.stats.cantidadAtaque;
							ExplosionBalas(play,bala.model.x,bala.model.y);
							Hero.TodasBalas.splice(i,1);
							play.Pantalla.view.removeChild(bala.model);
							if(slime.Vida <= 0)
							{
								eliminarEnemy(play,slime.model,j,bala.model);
								game.bestiario.slime = true;
								play.enemies.AllSlime.splice(j,1);
								updateExpBar(game,play,slime.exp);
							}
							return;
						}
					}
					/*slime.Vida = comprobarEnemigos(bala.model,slime.model,slime.Vida,game,play,j,i);
					return;*/
					j++;
				}
				j = 0;
				for each (var torreta:TorretaEnemy in play.enemies.AllTorreta) 
				{
					if(bala.model != null && torreta.model != null)
					{
						if(bala.model.hitTestObject(torreta.model))
						{
							torreta.Vida = torreta.Vida - game.stats.cantidadAtaque;
							ExplosionBalas(play,bala.model.x,bala.model.y);
							Hero.TodasBalas.splice(i,1);
							play.Pantalla.view.removeChild(bala.model);
							if(torreta.Vida <= 0)
							{
								eliminarEnemy(play,torreta.model,j,bala.model);
								game.bestiario.torreta = true;
								play.enemies.AllTorreta.splice(j,1);
								updateExpBar(game,play,torreta.exp);
							}
							return;
						}
					}
					j++;
				}
				
				j = 0;
				for each (var minion:MinionEnemy in play.enemies.AllMinion) 
				{
					if(bala.model != null && minion.model != null)
					{
						if(bala.model.hitTestObject(minion.model))
						{
							minion.Vida = minion.Vida - game.stats.cantidadAtaque;
							ExplosionBalas(play,bala.model.x,bala.model.y);
							Hero.TodasBalas.splice(i,1);
							play.Pantalla.view.removeChild(bala.model);
							if(minion.Vida <= 0)
							{
								eliminarEnemy(play,minion.model,j,bala.model);
								game.bestiario.minion = true;
								play.enemies.AllMinion.splice(j,1);
								updateExpBar(game,play,minion.exp);
							}
							return;
						}
					}
					j++;
				}
				
				j = 0;
				for each (var magnetBomb:MagnetBombEnemy in play.enemies.AllMagnetBomb) 
				{
					if(bala.model != null && magnetBomb.model != null)
					{
						if(bala.model.hitTestObject(magnetBomb.model))
						{
							magnetBomb.Vida = magnetBomb.Vida - game.stats.cantidadAtaque;
							ExplosionBalas(play,bala.model.x,bala.model.y);
							Hero.TodasBalas.splice(i,1);
							play.Pantalla.view.removeChild(bala.model);
							if(magnetBomb.Vida <= 0)
							{
								eliminarEnemy(play,magnetBomb.model,j,bala.model);
								game.bestiario.magnetBomb = true;
								play.enemies.AllMagnetBomb.splice(j,1);
								updateExpBar(game,play,magnetBomb.exp);
							}
							return;
						}
					}
					j++;
				}
				
				for each (var parede:MovieClip in play.Pantalla.AllParedes) 
				{
					if(bala.model.hitTestObject(parede))
					{
						ExplosionBalas(play,bala.model.x,bala.model.y);
						Hero.TodasBalas.splice(i,1);
						play.Pantalla.view.removeChild(bala.model);
						return;
					}
				}
				for each (var pisoe:MovieClip in play.Pantalla.AllPisos) 
				{
					if(bala.model.hitTestObject(pisoe))
					{
						ExplosionBalas(play,bala.model.x,bala.model.y);
						Hero.TodasBalas.splice(i,1);
						play.Pantalla.view.removeChild(bala.model);
						return;
					}
				}
				i++;
			}
			
			
			
		}
		
		private function comprobarEnemigos(bala:MovieClip,enemy:MovieClip,Vida:int,game:Game,play:Play,j:int,i:int):int
		{
			if(bala != null && enemy != null)
			{
				if(bala.hitTestObject(enemy))
				{
					Vida = Vida - game.stats.cantidadAtaque;
					Hero.TodasBalas.splice(i,1);
					if(Vida <= 0)
					{
						eliminarEnemy(play,enemy,j,bala);
					}
				}
			}
			return Vida;
		}
		
		private function eliminarEnemy(play:Play,enemy:MovieClip,j:int,bala:MovieClip):void
		{
			var Ples:MC_ExplosionEnemigos = new MC_ExplosionEnemigos();
			play.Pantalla.view.addChild(Ples);
			Ples.x = enemy.x;
			Ples.y = enemy.y;
			
			//PLEHHHHHHRSEKER XD
			//enemy.x = 8000;
			//OP XD izi pizi
			enemy.parent.removeChild(enemy);
		}
		
		private function eliminarEnemyColision(play:Play,enemy:MovieClip):void
		{
			var Ples:MC_ExplosionEnemigos = new MC_ExplosionEnemigos();
			play.Pantalla.view.addChild(Ples);
			Ples.x = enemy.x;
			Ples.y = enemy.y;
			
			//PLEHHHHHHRSEKER XD
			//enemy.x = 8000;
			//OP XD izi pizi
			enemy.parent.removeChild(enemy);
		}
				
		public function Finish(play:Play):void
		{
			for each (var Finish:MovieClip in play.Pantalla.AllFinish)
			{
				/*if(play.hero.MyHero.model.Pies.hitTestObject(Finish) || play.hero.MyHero.model.Frente.hitTestObject(Finish))
				{
					play.enemies.EnemigosMatados = 8000;//Ganaste xD
				}*/
				if((play.hero.MyHero.model.x <= Finish.x+20 && play.hero.MyHero.model.x >= Finish.x-20) && play.hero.MyHero.model.hitTestObject(Finish))
				{
					play.enemies.EnemigosMatados = 8000;//Ganaste xD
				}
			}
		}
		
		public function Springo(play:Play):void
		{
			var FlagPiso:Boolean = false;
			var FlagPared:Boolean = false;
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				if(play.hero.MyHero.model.Cabeza.hitTestObject(piso))
				{
					FlagPiso = true;
				}
			}
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(play.hero.MyHero.model.Cabeza.hitTestObject(pared))
				{
					FlagPared = true;
				}
			}
			
			for each (var Springo:MovieClip in play.Pantalla.AllSpringo)
			{
				if(play.hero.MyHero.model.Pies.hitTestObject(Springo))
				{
					play.Timers.TimerSpringo = 60;
					CambiarAnimacion(Springo,"Rebote");
				}
			}
			if(play.Timers.TimerSpringo > 0)
			{
				if(!FlagPiso && !FlagPared)
				{
					play.hero.MyHero.model.y = play.hero.MyHero.model.y - 30;
					play.Timers.TimerSpringo = play.Timers.TimerSpringo - 1;
				}
				else
				{
					play.Timers.TimerSpringo = 0;
				}
			}
		}		
		
		public function Pinches(game:Game,play:Play):void
		{
			for each (var pinche:MovieClip in play.Pantalla.AllPinches)
			{
				//Si cualquier parte del Hero colisiona con algun pinche se muere 
				if(play.hero.MyHero.model.Pies.hitTestObject(pinche) || play.hero.MyHero.model.Espalda.hitTestObject(pinche)
					|| play.hero.MyHero.model.Cabeza.hitTestObject(pinche) || play.hero.MyHero.model.Frente.hitTestObject(pinche))
				{
					play.hero.VidaPersonaje = 0;;
					updateHealthBar(game,play);
				}
			}
		}
		
		public function Heal(game:Game,play:Play):void
		{
			for each (var Heal:MovieClip in play.Pantalla.AllHeal)
			{
				if(play.hero.MyHero.model.Pies.hitTestObject(Heal))
				{
					if (play.hero.VidaPersonaje < (play.hero.VidaMaximaPersonaje + game.stats.cantidadVida - 1)) 
					{
						play.hero.VidaPersonaje++;
						updateHealthBar(game,play);
					}
				}
			}
		}
		
		private function updateHealthBar(game:Game,play:Play):void
		{
			play.hero.MyHero.updateHealthBar(play.hero.VidaPersonaje,play.hero.VidaMaximaPersonaje + game.stats.cantidadVida - 1,play.hero.HPBar);
			play.textosModel.TextoVida.text = play.hero.VidaPersonaje+"/"+play.hero.VidaTotal;
		}
		
		private function updateExpBar(game:Game,play:Play,exp:int):void
		{
			game.player.exp += exp;
			while (game.player.exp >= game.player.siguienteNivel) 
			{
				game.player.exp -= game.player.siguienteNivel;
				game.player.siguienteNivel *= 2;
				game.player.lvl++;
				game.stats.puntos += 5;
			}
			play.hero.MyHero.updateExpBar(game.player.exp,game.player.siguienteNivel,play.hero.ExpBar);
			play.textosModel.TextoExp.text = "LVL:"+game.player.lvl+" EXP: "+game.player.exp+"/"+game.player.siguienteNivel;
		}
		
		public function ComprobarColisionZubat(zubat:ZubatEnemy,play:Play,mov:int,x:Boolean,game:Game):Boolean
		{
			var colision:Boolean = false;
			if (x) 
			{
				zubat.model.x += mov;
			}
			else
			{
				zubat.model.y += mov;
			}
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				if(zubat.model.hitArea.hitTestObject(piso))
				{
					colision = true;
				}
			}
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(zubat.model.hitArea.hitTestObject(pared))
				{
					colision = true;
				}
			}
			if (x) 
			{
				zubat.model.x -= mov;
			}
			else
			{
				zubat.model.y -= mov;
			}
			//if(play.hero.MyHero.model.HitBox.hitTestObject(zubat.model.hitArea))
			if(play.hero.MyHero.model.hitTestObject(zubat.model))
			{
				play.Timers.TimerAtaqueZubat = play.Timers.TimerAtaqueZubat +1;
				if(play.Timers.TimerAtaqueZubat > 60)
				{
					play.hero.VidaPersonaje = play.hero.VidaPersonaje - zubat.atk;
					if (zubat.Vida < 3) 
					{
						zubat.Vida = zubat.Vida + 1;	
					}
					updateHealthBar(game,play);
					play.Timers.TimerAtaqueZubat = 0;
				}
			}
			return colision;
		}
		
		private function ColisionMinion(minion:MinionEnemy,play:Play,mov:int,x:Boolean,game:Game):Boolean
		{
			var colision:Boolean = false;
			var algunaColision:Boolean = false;
			if (x) 
			{
				minion.model.x += mov;
			}
			else
			{
				minion.model.y += mov;
			}
			
			//Colision con los pisos XD
			for each (var piso:MovieClip in play.Pantalla.AllPisos) 
			{
				//esto es si colisiona con el piso entonces hubo alguna colision y puede avanzar
				//PARA ARREGLAR el bug de la volada el minion deberia tener pies y preguntar por los pies del minion directamente XD
				if(minion.model.hitTestObject(piso))
				{
					//entonces alguna colision se pone en true
					algunaColision = true;
				}
			}
			//verifico si no colisiono con ningun piso y si no colisiono con ningun piso
			//entonces pongo colision en true que significa que no puede avanzar, por que acordate que ese colision era para las paredes pero ahora lo hice para los pisos XD
			if(algunaColision == false)
			{
				colision = true;
			}//fin de Colision con Pisos
			
			for each (var pared:MovieClip in play.Pantalla.AllParedes) 
			{
				if(minion.model.hitTestObject(pared))
				{
					colision = true;
				}
			}
			if (x) 
			{
				minion.model.x -= mov;
			}
			else
			{
				minion.model.y -= mov;
			}
			return colision;
		}
		
		public function Minion(play:Play,game:Game):void
		{
			var XRango:int = 0;
			for each (var minion:MinionEnemy in play.enemies.AllMinion)
			{
				if(minion.model.currentLabel != "Atacar")
				{
					var MinionRango:int = 325;
					XRango =  minion.model.x - play.hero.MyHero.model.x;
					if (XRango<0) 
					{
						XRango = XRango * -1;
					}
					if (XRango <= MinionRango)
					{
						if(play.hero.MyHero.model.x >= minion.model.x - MinionRango && play.hero.MyHero.model.x <= minion.model.x + MinionRango)
						{
							if(minion.model.x > play.hero.MyHero.model.x)
							{
								if (!ColisionMinion(minion,play,-5,true,game)) 
								{
									minion.model.x = minion.model.x - 5;
									minion.model.scaleX = 1;
									CambiarAnimacion(minion.model,"Caminar");
								}
							}
							else if (minion.model.x < play.hero.MyHero.model.x)
							{
								if (XRango>=5) 
								{
									if (!ColisionMinion(minion,play,5,true,game))
									{
										minion.model.x = minion.model.x + 5;
										minion.model.scaleX = -1;
										CambiarAnimacion(minion.model,"Caminar");
									}
								}
							}
						}
					}
					else
					{
						CambiarAnimacion(minion.model,"Idle");
					}
				}
				
				if(play.hero.MyHero.model.HitBox.hitTestObject(minion.model) && play.FlagInvencibilidad == 0)
				{
					play.FlagRecoil = 1;
					play.FlagInvencibilidad = 1;
					play.hero.VidaPersonaje = play.hero.VidaPersonaje - minion.atk;
					updateHealthBar(game,play);
					CambiarAnimacion(minion.model,"Atacar");
				}
				

			}
		}
		
		private function CambiarAnimacion(model:MovieClip,name:String):void
		{
			if(model.currentLabel != name)
			{
				model.gotoAndPlay(name);
			}
		}
		
		public function Zubat(play:Play,game:Game):void
		{
			var XRango:int = 0;
			var YRango:int = 0;
			var HarcodeoXD:int = - 70;
			
			for each (var zubat:ZubatEnemy in play.enemies.AllZubat)
			{
				var ZubatRango:int = 400;
				XRango =  zubat.model.x - play.hero.MyHero.model.x;
				YRango =  zubat.model.y - play.hero.MyHero.model.y - HarcodeoXD;
				if (XRango<0) 
				{
					XRango = XRango * -1;
				}
				if (YRango<0) 
				{
					YRango = YRango * -1;
				}
				
				if (XRango <= ZubatRango)
				{
					if(YRango <= ZubatRango)
					{
						//Parte de X
						if(play.hero.MyHero.model.x >= zubat.model.x - ZubatRango && play.hero.MyHero.model.x <= zubat.model.x + ZubatRango)
						{
							if(zubat.model.x > play.hero.MyHero.model.x)
							{
								if (!ComprobarColisionZubat(zubat,play,-5,true,game)) 
								{
									zubat.model.x = zubat.model.x - 5;
									zubat.model.scaleX = 1;
								}
							}
							else if (zubat.model.x < play.hero.MyHero.model.x)
							{
								if (XRango>=5) 
								{
									if (!ComprobarColisionZubat(zubat,play,5,true,game))
									{
										zubat.model.x = zubat.model.x + 5;
										zubat.model.scaleX = -1;
									}
								}
								else
								{
									ComprobarColisionZubat(zubat,play,1,true,game);
								}
							}
							else
							{
								ComprobarColisionZubat(zubat,play,1,true,game);
							}
						}
						//Parte de Y
						var heroY:int = play.hero.MyHero.model.y + HarcodeoXD;
						if(heroY >= zubat.model.y - ZubatRango && heroY <= zubat.model.y + ZubatRango)
						{
							if(zubat.model.y > heroY)
							{
								if (!ComprobarColisionZubat(zubat,play,-5,false,game))
								{
									zubat.model.y = zubat.model.y - 5;
								}
							}
							else if (zubat.model.y < heroY)
							{
								if (YRango>=5) 
								{
									if (!ComprobarColisionZubat(zubat,play,5,false,game))
									{
										zubat.model.y = zubat.model.y + 5;
									}
								}
								else
								{
									ComprobarColisionZubat(zubat,play,1,true,game);
								}
							}
							else
							{
								ComprobarColisionZubat(zubat,play,1,false,game);
							}
						}
					}
				}
				else if(play.Timers.TimerZubat < 240)
				{
					if (!ComprobarColisionZubat(zubat,play,-5,true,game))
					{
						zubat.model.x = zubat.model.x - 5;
					}
					play.Timers.TimerZubat++;
				}
				else
				{
					if (!ComprobarColisionZubat(zubat,play,5,true,game))
					{
						zubat.model.x = zubat.model.x + 5;
					}
					play.Timers.TimerZubat++;
					if(play.Timers.TimerZubat > 480)
					{
						play.Timers.TimerZubat = 0;
					}
				}
				
			}
		}
		
		public function Slime(play:Play,game:Game):void
		{
			for each (var slime:SlimeEnemy in play.enemies.AllSlime)
			{
				for each (var pared:MovieClip in play.Pantalla.AllParedes) 
				{
					if(slime.model.hitTestObject(pared))
					{
						slime.model.scaleX = slime.model.scaleX * -1;
						slime.dir = slime.dir * -1;
						slime.model.x = slime.model.x + 20 * slime.dir;
					}
					else
					{
						slime.model.x = slime.model.x + 0.5 * slime.dir;
					}
				}
				if(play.hero.MyHero.model.HitBox.hitTestObject(slime.model) && play.FlagInvencibilidad == 0)
				{
					play.FlagRecoil = 1;
					play.FlagInvencibilidad = 1;
					play.hero.VidaPersonaje = play.hero.VidaPersonaje - slime.atk;
					updateHealthBar(game,play);
					
				}
			}
		}
		
		public function MagnetBomb(play:Play,game:Game):void
		{
			var j:int = 0;
			for each (var magnetBomb:MagnetBombEnemy in play.enemies.AllMagnetBomb)
			{
				for each (var pared:MovieClip in play.Pantalla.AllParedes) 
				{
					if(magnetBomb.model.hitTestObject(pared))
					{
						magnetBomb.model.scaleX = magnetBomb.model.scaleX * -1;
						magnetBomb.dir = magnetBomb.dir * -1;
						magnetBomb.model.x = magnetBomb.model.x + 20 * magnetBomb.dir;
					}
					else
					{
						magnetBomb.model.x = magnetBomb.model.x + 0.5 * magnetBomb.dir;
					}
				}
				if(play.hero.MyHero.model.HitBox.hitTestObject(magnetBomb.model) && play.FlagInvencibilidad == 0)
				{
					play.FlagRecoil = 1;
					play.FlagInvencibilidad = 1;
					play.hero.VidaPersonaje = play.hero.VidaPersonaje - magnetBomb.atk;
					updateHealthBar(game,play);
					eliminarEnemyColision(play,magnetBomb.model);
					play.enemies.AllMagnetBomb.splice(j,1);
				}
				j++;
			}
		}
		
		
		public function Torreta(play:Play,game:Game):void
		{
			for each (var torreta:TorretaEnemy in play.enemies.AllTorreta)
			{
				torreta.CooldownTorreta = torreta.CooldownTorreta + 1;
				if(torreta.CooldownTorreta >= 130)
				{
					var balaE:BalasDeEnemies = new BalasDeEnemies();
					balaE.spawn(torreta.model.x,torreta.model.y,play.Pantalla.view);
					play.enemies.TodasBalas.push(balaE);
					torreta.CooldownTorreta = 0;
					torreta.model.gotoAndPlay("Disparar");
				}
				if(play.hero.MyHero.model.HitBox.hitTestObject(torreta.model) && play.FlagInvencibilidad == 0)
				{
					play.FlagRecoil = 1;
					play.FlagInvencibilidad = 1;
					play.hero.VidaPersonaje = play.hero.VidaPersonaje - torreta.atk*2;
					updateHealthBar(game,play);
				}
			}
		}
		
		public function ColisionBalasEnemigos(play:Play,game:Game):void
		{
			var i:int = 0;
			for each (var bala:BalasDeEnemies in play.enemies.TodasBalas) 
			{
				for each (var pared:MovieClip in play.Pantalla.AllParedes) 
				{
					if(bala.model.hitTestObject(pared) && bala != null)
					{
						ExplosionBalas(play,bala.model.x,bala.model.y);
						play.Pantalla.view.removeChild(bala.model);
						play.enemies.TodasBalas.splice(i,1);
						return;
					}
				}
				if(bala.model != null && bala.model.hitTestObject(play.hero.MyHero.model) && play.FlagInvencibilidad == 0)
				{
					ExplosionBalas(play,bala.model.x,bala.model.y);
					//el daño que recibe del disparo hay que cambiarlo
					play.hero.VidaPersonaje = play.hero.VidaPersonaje - 2;
					updateHealthBar(game,play);
					play.Pantalla.view.removeChild(bala.model);
					play.enemies.TodasBalas.splice(i,1);
					play.FlagRecoil = 1;
					play.FlagInvencibilidad = 1;
					return;
				}
				i++;
			}
		}
		
		private function ExplosionBalas(play:Play,x:int,y:int):void
		{
			var Berseeek:MC_ExplosionDisparo = new MC_ExplosionDisparo();
			play.Pantalla.view.addChild(Berseeek);
			Berseeek.x = x;
			Berseeek.y = y;
			Berseeek.scaleX = 0.4;
			Berseeek.scaleY = 0.4;
		}
		
	}
}