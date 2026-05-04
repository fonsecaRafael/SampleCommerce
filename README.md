# SampleCommerce
Questo è il backend di un e-commerce dove gli utenti possono registrarsi come acquirenti e, in seguito, diventare venditori.  

È sviluppato interamente con .NET 10 e Blazor. I file SQL forniti sono stati creati per SQL Server.  

Per avviare il progetto, segui questi passaggi:  

1- Nella cartella chiamata SQL troverai due file:  
esegui il file SampleEcommerceDB_creation.sql in un DBMS per creare il database.  

2- Crea un file appsettings.Development.json con il seguente contenuto:  

JSON
`{
  "AllowedHosts": "*",
  "ConnectionString": "YOUR_CONNECTION_STRING"
}`  

Se usi SQL Server, la tua stringa di connessione dovrebbe essere simile a:  
"Server=YOUR_SERVER;Database=SampleEcommerceDb;Trusted_Connection=True;Encrypt=False;TrustServerCertificate=True;"  

**Fatto! A questo punto l'API dovrebbe già essere funzionante.**

Tuttavia, il database sarà vuoto. Se vuoi testarlo con dei dati di esempio, dovrai anche:  

3- Eseguire il file SampleEcommerceDB_product_Population.sql che si trova sempre nella cartella SQL del progetto.

Il file ...product_Population.sql inserisce alcuni prodotti e due utenti:  
uno con email e password "**compratore**" e l'altro con email e password "**venditore**".  
Tutti i prodotti inseriti appartengono a quest'ultimo.  

**Nota:** In questo progetto ci sono ancora diversi miglioramenti da fare, come la validazione dei dati e della logica.  
Sia il backend che il frontend sono stati realizzati nell'arco di due settimane.