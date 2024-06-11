import vagones.*
import locomotoras.*
class Formacion{
	const vagones = []
	
	method agregarVagones(_vagones){
		_vagones.forEach({vag => vagones.add(vag)})
	}
	method cantPasajerosMax(){
		/*hasta cuántos pasajeros puede llevar */
		return vagones.sum({vag => vag.cantDePasajeros()})
	}
	method cantVagonesPasajeros(){
		/*cuántos vagones populares tiene. Un vagón es popular si puede llevar más de 50 pasajeros */
		const vagonesPopulares = vagones.count({vag => vag.cantDePasajeros() > 50}) 
		return vagonesPopulares
	}
	method esFormacionCarguera(){
		/*si es una formación carguera, o sea, si todos los vagones pueden transportar al menos 1000 kilos de carga. */
		return vagones.all({vag => vag.cantMaxCarga() >= 1000})
	}
	method dispercionDePeso(){
		const pesosMax = vagones.map({vag => vag.pesoMax()}) 
		const pesoMax =  pesosMax.max()
		const pesoMin = pesosMax.min()
		return pesoMax - pesoMin
	}
	method cantDeBanios(){
		/*cuántos baños tiene una formación, que se obtiene como la cantidad de vagones que tienen baños (se supone que cada vagón que tiene baños, tiene uno solo). */
		const vagonesConBanios = vagones.filter({vag => vag.tieneBanio()})
		return vagonesConBanios.size()
	}
	method hacerMantenimiento(){
		vagones.forEach({vag => vag.mantenimiento()})
	}
	method estaEquilibradaEnPasajeros(){
		/*si está equilbrada en pasajeros, o sea: si considerando sólo los vagones que llevan pasajeros,
		 * la diferencia entre el que más lleva y el que menos no supera los 20 pasajeros. */
		const vagonesPasajeros = vagones.filter({vag => vag.cantDePasajeros()})
		const vagPasajerosMax =  vagonesPasajeros.max({vag => vag.cantDePasajeros()})
		const vagPasajerosMin =  vagonesPasajeros.min({vag => vag.cantDePasajeros()})
		return (vagPasajerosMax - vagPasajerosMin) < 20
	}
	method estaOrganizada(){
		const parteDeAdelante = vagones.subList(0, self.cantVagonesPasajeros())
		 return parteDeAdelante.all({ vag => vag.cantDePasajeros()})
    }
    method velocidadMax(){
    	const locomotoras = vagones.filter({vag => vag.velocidadMax()})
    	return locomotoras.min({loc => loc.velocidadMax()}).map({loc => loc.velocidadMax()})
    }
    method esEficiente(){
    	const locomotoras = vagones.filter({vag => vag.velocidadMax()})
    	return locomotoras.all({loc => loc.esEficiente()})
    }
    method puedeMoverse(){
    	const locomotoras = vagones.filter({vag => vag.velocidadMax()})
    	const vagon = vagones.filter({vag => vag.pesoMax()})
    	return locomotoras.sum({loc => loc.cantMaxArrastre()}) >= locomotoras.sum({loc => loc.peso()}) + vagon.sum({vag => vag.pesoMax()})
    }
    method cantKilosEmpuje(){
    	const locomotoras = vagones.filter({vag => vag.velocidadMax()})
    	const vagon = vagones.filter({vag => vag.pesoMax()})
    	return if(self.puedeMoverse()) 0 else vagon.sum({vag => vag.pesoMax()}) - locomotoras.sum({loc => loc.cantMaxArrastre()})
    }
}
