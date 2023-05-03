module Library where
import PdePreludat

data Planta = UnaPlanta {
    especie:: [Char],
    puntosDeVida:: Number,
    solesQueProduce:: Number,
    poderDeAtaque:: Number
}deriving(Show,Eq)

data Zombie = UnZombie {
    nombre:: [Char],
    accesorios:: [[Char]],
    dañoPorMordida:: Number
}deriving(Show,Eq)

data Linea = LineaDeDefensa {
    plantas:: [Planta],
    zombies:: [Zombie]
}deriving(Show,Eq)

peaShooter = UnaPlanta "PeaShooter" 5 0 2
repeater = UnaPlanta "Repeater" 5 0 4
sunflower = UnaPlanta "SunFlower" 7 1 0
nut = UnaPlanta "Nut" 100 0 0
tripleSunflower = UnaPlanta "TripleSunflower"  7 3 0
cherryCanon = UnaPlanta "CherryCanon" 4 0 8

zombieBase = UnZombie "ZombieBase" [] 1
ballonzombie = UnZombie "BallonZombie" ["Globo"] 1
newspaperzombie = UnZombie "NewspaperZombie" ["Diario"] 2
gargantuar = UnZombie "GargantuarHulkSmashPunyGod" ["PosteElectrico", "ZombieEnano"] 30

linea1 = LineaDeDefensa [sunflower, sunflower, sunflower] []
linea2 = LineaDeDefensa [peaShooter, peaShooter, sunflower, nut] [zombieBase, newspaperzombie]
linea3 = LineaDeDefensa [sunflower, peaShooter] [gargantuar, zombieBase, zombieBase]

nivelDeMuerte:: Zombie -> Number
nivelDeMuerte = (length.nombre)

cantidadAccesorios:: Zombie -> Number
cantidadAccesorios = (length.accesorios)

especialidad:: Planta -> [Char]
especialidad planta | solesQueProduce(planta) /= 0 = "Proveedora"
                    | poderDeAtaque(planta) > puntosDeVida(planta) = "Atacante"
                    | otherwise = "Defensiva"

esPeligroso:: Zombie -> Bool
esPeligroso zombie  = cantidadAccesorios(zombie) >= 1 || nivelDeMuerte(zombie) > 10

-- 3 A se hace con una funcion que cree la misma linea, con la modificacion de planta o zombie