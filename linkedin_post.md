Durante el fin de semana retomé mi exploración de las herramientas de #deeplearning de Dymaxion Labs, para la identificación de piscinas a partir de fotos aéreas de la ciudad de #Montevideo, disponibles en la SIG de la Intendencia.

Con unas pocas etiquetas y casi nada de ajustes sobre le modelo, los resultado son muy buenos! Algún que otro falso positivo, que se podría evitar con un postprocesamiento más elaborado, y algunas piscinas sin identificar, pero sin dudas un resultado bueno.

En el área de interés, que abarca los principales barrios residenciales del Este de la ciudad, la cantidad de piscinas detectadas fue de 3.500.

Este mini-proyecto es sólo un ejercicio para aprender #deeplearning aplicado a imágenes, sin embargo se me ocurren algunos posibles usos:

El más obvio es vender piscinas! Si quiere vender piscinas o servicios de mantenimiento ya sabe que puerta golpear o no golpear.

Otro es la fiscalización de piscinas sin mantenimiento. Si existiera marco legal para ello, dado que las acumulaciones de agua pueden ser lugares donde se puede reporudcir el mosquito Aedes aegypti, vector del #dengue, esta información podría ser útil.

Y en tercer lugar, dado que la #OSE, la empresa estatal de suministro de agua potable a incitado al consumo responsable de agua, en el marco de la gran sequía y prolongado déficit hídrico que afecta el país, la información también se podría usar para fiscalizar el uso responsable de tan preciado recurso. Imagino que cruzando con los consumos de agua se puede llegar a algo relevante. Pero tampoco creo que haya marco legal para esto.

Espero en el corto plazo poder comenzar a usar Pytorch para imágenes satelitales.

------------------------------------------------------------

Over the weekend, I've been working on this small side-project of using Dymaxion Labs #deeplearning tools to recognize pools from aerial photography on #Montevideo. With only a few labels and almost no tuning of the model, the outcome is very good! There are some false positives that could be avoided by developing a more detailed post-process. Also, some pools remain undetected, but the result is overall good. In the area of interest, which covers the main residential neighborhoods of the East side of the city, a total of 3,500 pools were detected. This tiny project is just an excuse for learning, however, some possible use cases come to my mind. If you are interested in selling pools or pool maintenance services, you would know what doors to know on (or what doors to avoid!) Suppose the municipality would like to inspect pools that lack of maintenance, regarding that these abandoned pools could be a spot for mosquitoes to reproduce. In that case, this could be an interesting source of data. Last but not least, in the midst of the severe drought that #Uruguay is currently experiencing, this could be used to look after the reasonable use of tap water. My next milestone is to use Pytorch, a machine learning framework, in satellite imagery.