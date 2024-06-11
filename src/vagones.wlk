class VagonDePasajero{
	var largo
	var ancho
	var tieneBanio
	var ordenado
	
	method cantDePasajeros(){
		const cantPasajeros = if(ancho <= 3) 8 * largo else 10 * largo
		return if(ordenado) cantPasajeros else cantPasajeros - 15
	}
	method cantMaxCarga(){
		return if(tieneBanio) 300 else 800
	}
	method pesoMax(){
		return 2000 + 80 *  self.cantDePasajeros() + self.cantMaxCarga()
	}
	method tieneBanio(){
		return tieneBanio
	}
	method estaOrdenado(){
		return ordenado
	}
	method mantenimiento(){
		ordenado = true
	}
}
class VagonDeCarga{
	var cargaMaximaIdeal
	var cantMaderas
	method cantDePasajeros(){
				return 0
	}
	method cantMaxCarga(){
		return cargaMaximaIdeal - 400 * cantMaderas
	}
	method pesoMax(){
		return 1500 + self.cantMaxCarga()
	}
	method tieneBanio(){
		return false
	}
	method mantenimiento(){
		cantMaderas -= if(cantMaderas >= 2) 2 else cantMaderas
	}
}
class VagonDormitorio{
	var cantCompratimientos
	var cantCamasPorCompartimientos

	method cantDePasajeros(){
		return  cantCompratimientos * cantCamasPorCompartimientos
		}
	method cantMaxCarga(){
		return 1200
	}
	method pesoMax(){
		return 4000 + 80 * self.cantDePasajeros() + self.cantMaxCarga()
	}
	method tieneBanio(){
		return true
	}
	method mantenimiento(){
		return "no hace nada"
	}
}



