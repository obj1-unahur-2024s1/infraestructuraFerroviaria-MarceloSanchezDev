class Locomotora {
	var peso
	var cantMaxArrastre
	var velocidadMax
	
	method peso(){
		return peso
	}
	method cantMaxArrastre(){
		return cantMaxArrastre
	}
	method velocidadMax(){
		return velocidadMax
	}
	method esEficiente(){
		return self.peso() * 5 < self.cantMaxArrastre()
	}
	
}
