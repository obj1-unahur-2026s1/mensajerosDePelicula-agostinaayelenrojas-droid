
// DESTINOS

object puenteBrooklyn {

  method puedePasar(unMensajero){
    return unMensajero.peso() <= 1000
  }

}

object matrix {

  method puedePasar(unMensajero){
    return unMensajero.puedeLlamar()
  }

}


// VEHICULOS

object bicicleta {
  method pesoExtra() = 5
}

object camion {
  var acoplado = 0
  method acoplado() = acoplado

  method acoplado(unNumero){
    acoplado = unNumero
  }

  method pesoExtra(){
    return acoplado * 500
  }

}


// PAQUETES

object paquete1 {
  method destino() {
    return puenteBrooklyn
  }

  method pago() {
    return true
  }

  method puedeSerEntregadoPor(unMensajero){
    return self.pago() && self.destino().puedePasar(unMensajero)
  }

}

object paquete2 {
  method destino() {
    return matrix
  }

  method pago() {
    return false
  }

  method puedeSerEntregadoPor(unMensajero){
    return self.pago() && self.destino().puedePasar(unMensajero)
  }

}


// MENSAJEROS

object roberto {

  var vehiculo = bicicleta

  method cambiarVehiculo(unVehiculo){
    vehiculo = unVehiculo
  }

  method peso(){
    return 90 + vehiculo.pesoExtra()
  }

  method puedeLlamar() = false

}


object chuckNorris {

  method peso() = 80

  method puedeLlamar() = true

}


object neo {

  var credito = true

  method tieneCredito(unValor){
    credito = unValor
  }

  method peso() = 0

  method puedeLlamar(){
    return credito
  }

}


//segunda Parte 
object mensajero{ 
  var mensajeros= [] 
  method mensajeros(){ 
    return mensajeros 
  } 
  method contratar(unMensajero){ 
    mensajeros.add(unMensajero) 
    } 
    
  method despedir(unMensajero){
    mensajeros.remove(unMensajero) 

  }
  method despedirATodos(){
    mensajeros.clear()
  }
  method mensajeriaGrande(){
    mensajeros.size() > 2
  }
  method  primerMensajeroPuede(paquete){
    return paquete.puedeSerEntregadoPor(mensajeros.first())
  }
  method pesoUltimoMensajero(){
    return mensajeros.last().peso()
  }

  //tercera parte
  method puedeEntregar(unPaquete){
    return mensajeros.any({mensajero => unPaquete.puedeSerEntregadoPor(mensajero)})
  }
  method mensajeroPuedeEntregar(unPaquete){
    return mensajeros.filther({mensajero => unPaquete.puedeSerEntregadoPor(mensajero)})
  }

  method mensajeriaConSobrepeso(){
    return mensajeros.average({mensajero => mensajero.peso()>500})
  }
  method enviarPaquete(){
    return mensajeros.anyOne({mensajero => mensajero.enviarPaquete()})
  }
  method facturacion(){
    return enviarPaquete.sum({paquetes => paquetes.precio()})
  }
  method enviarTodoslosPaquetes(paquete){
    return paquete.forEach({paquetes => self.enviarPaquete()})
  }
  method enviarPaqueteMasCaro(paquete){
    
    var masCaro = paquete.max({paquetes => paquete.precio()})

    paquete.enviarPaquete(masCaro)
    paquete.remove(masCaro)
  }
}



// tercera parte

object paquetito{
  method precio ()=0
  method estaPagado()= true
  method puedeSerEntregadoPor(unMensajero){
    return true
  }
}

object paquetonViajero{
  var dineroPagado = 0
  var destinos=[puenteBrooklyn, matrix]
  method destinos()= destinos
  method precio(){
    return destinos.size() * 100
  }
  
  method pagar(unMonto){
    dineroPagado=dineroPagado + unMonto
  }

  method estaPago(){
    return dineroPagado >= self.precio()
  }
  method puedeSerEntregadoPor(unMensajero){
    return self.estaPago() && destinos.all({
      destino => destino.puedePasar(unMensajero)
    })
  }

}
object paqueteOriginal{
  method precio()= 50
}

