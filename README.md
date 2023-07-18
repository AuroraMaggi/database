# Presentazione generale

<<https://amaggi.altervista.org/TEST_REGESTA/finale/index.html>>

Il sito web fornito si mostra con un modulo di inserimento di valori e pulsanti per visualizzare tabelle di dati. L'obiettivo principale del codice è consentire all'utente di inserire dati tramite il modulo e visualizzare tabelle di dati attraverso i pulsanti.

La sezione "Inserimento valori" del modulo presenta campi di input per l'ID, il nome e il prezzo di vendita di un articolo. L'utente può inserire i valori desiderati in questi campi e fare clic sul pulsante "Inserisci" per inviare i dati al server, utilizzando il codice in PHP "inserimento.php".

La sezione "Visualizzazione tabelle" offre due pulsanti. Il primo pulsante, denominato "Visualizza", consente di visualizzare un elenco degli articoli disponibili. Il secondo pulsante, contrassegnato come "ANCORA IN FASE DI GESTIONE", è destinato a mostrare i dati e le informazioni dei fornitori, ma attualmente è ancora in fase di sviluppo.

# Sistema di Gestione degli Acquisti per il Negozio

Questo progetto è un sistema di gestione degli acquisti per un negozio che vende beni provenienti da diversi fornitori. Il sistema consente di selezionare un articolo e una quantità desiderata e calcola l'importo totale dell'ordine di acquisto applicando gli sconti disponibili dai fornitori. Inoltre, suggerisce il miglior fornitore evidenziando quello con il prezzo più conveniente e visualizza i giorni minimi necessari per la spedizione di ciascun fornitore.

## Funzionalità principali 

- Visualizzazione dell'elenco degli articoli disponibili nel magazzino e delle relative quantità.
- Calcolo dell'importo totale dell'ordine di acquisto in base al prezzo di vendita e agli sconti dei fornitori.
- Suggerimento del miglior fornitore in base al prezzo scontato e ai giorni minimi di spedizione.
- Gestione dei dati dei fornitori, degli articoli e del magazzino tramite tabelle SQL.

## Struttura

Di seguito fornisco un ampliamento per spiegare le strutture utilizzate nel sistema e come sono collegate tra loro con gli attributi corrispondenti:
1.	Tabella "Articoli":
  •	id: Identificatore univoco dell'articolo (chiave primaria).
  •	nome: Nome dell'articolo.
  •	prezzo_vendita: Prezzo fisso di vendita dell'articolo.

2.	Tabella "Fornitori":
  •	id: Identificatore univoco del fornitore (chiave primaria).
  •	nome: Nome del fornitore.

3.	Tabella "Sconti":
  •	id: Identificatore univoco dello sconto (chiave primaria).
  •	fornitore_id: ID del fornitore associato (chiave esterna alla tabella "Fornitori").
  •	valore_minimo: Valore minimo dell'ordine per applicare lo sconto.
  •	percentuale_sconto: Percentuale di sconto offerta.
  •	data_inizio: Data di inizio validità dello sconto.
  •	data_fine: Data di fine validità dello sconto.

4.	Tabella "Magazzino":
  •	articolo_id: ID dell'articolo presente in magazzino (chiave esterna alla tabella "Articoli").
  •	fornitore_id: ID del fornitore che fornisce l'articolo in magazzino (chiave esterna alla tabella "Fornitori").
  •	quantita: Quantità disponibile dell'articolo nel magazzino.

5.	Tabella "Ordini":
  •	id: Identificatore univoco dell'ordine (chiave primaria).
  •	articolo_id: ID dell'articolo nell'ordine (chiave esterna alla tabella "Articoli").
  •	fornitore_id: ID del fornitore selezionato per l'ordine (chiave esterna alla tabella "Fornitori").
  •	quantita: Quantità di articoli richiesti nell'ordine.
  •	importo_totale: Importo totale dell'ordine calcolato applicando gli sconti (se disponibili).
  •	giorni_minimi_spedizione: Numero minimo di giorni richiesti per la spedizione dell'ordine dal fornitore selezionato.


Le tabelle sono collegate tra loro attraverso le seguenti relazioni:
    •	La tabella "Magazzino" collega gli articoli e i fornitori, consentendo di tener traccia delle quantità disponibili di ogni articolo da ogni fornitore.
    •	La tabella "Sconti" è collegata alla tabella "Fornitori" attraverso l'attributo fornitore_id, permettendo di associare sconti specifici a un determinato fornitore.
    •	Le tabelle "Articoli" e "Fornitori" sono collegate rispettivamente alle tabelle "Magazzino" e "Ordini" utilizzando gli attributi articolo_id e fornitore_id.
