SELECT * 
FROM WineProject..['winemag-data-2017-2020$']

--removed unnecessary columns from original data via excel

-- editing mistranslated characters in VARIETY
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Rosé', 'Rose')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Grüner Veltliner', 'Gruner Veltliner')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Albariño', 'Albarino')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Albariño', 'Albarino')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Sémillon', 'Saint-Emilion')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Gewürztraminer', 'Gewurztraminer')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'ô', 'o')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Blaufränkisch', 'Blaufrankisch')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Carmenère', 'Carmenere')
UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Mourvèdre', 'Mourvedre')

UPDATE WineProject..['winemag-data-2017-2020$']
SET variety = REPLACE(variety, 'Mourvèdre', 'Mourvedre')

-- editing mistranslated characters in PROVINCES
UPDATE WineProject..['winemag-data-2017-2020$']
SET province = REPLACE(province, 'Niederösterreich', 'Niederosterreich')
UPDATE WineProject..['winemag-data-2017-2020$']
SET province = REPLACE(province, 'Rhône Valley', 'Rhone Valley')
UPDATE WineProject..['winemag-data-2017-2020$']
SET province = REPLACE(province, 'Dão', 'Dao')

-- editing mistranslated characters in WINERY
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'La Purísima', 'La Purisima')
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'La Purísima', 'La Purisima')
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'Bodega y Viñedos Nicolas Catena', 'Bodega y Vinedos Nicolas Catena')
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'i�cluse', 'Ecluse')

-- realizing you can change the characters individually vs entire strings
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'Château', 'Chateau')
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'ñ', 'n')
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, '�', 'i')
UPDATE WineProject..['winemag-data-2017-2020$']
SET winery = REPLACE(winery, 'Si�bastien', 'Sebastien')

-- look at highest points per country
SELECT country, points
FROM WineProject..['winemag-data-2017-2020$']
WHERE country is not null
ORDER BY 1,2 DESC

-- distribution of average price per point
SELECT price, points
FROM WineProject..['winemag-data-2017-2020$']
WHERE price is not null
GROUP BY price, points
ORDER BY 1,2 DESC

-- point average per country
SELECT country, AVG(points) AS AverageScore
FROM WineProject..['winemag-data-2017-2020$']
WHERE country is not null
GROUP by country
ORDER BY 1,2 

-- distribution of wine types per point 
SELECT variety, points
FROM WineProject..['winemag-data-2017-2020$']
WHERE points >= 90 AND variety is not null
ORDER BY 2,1 DESC

-- distribution of wine types per point cleaned in excel and reuploaded for grouping
SELECT variety, AVG(points) AS AverageScore
FROM WineProject..varietyclean
WHERE points >= 90
GROUP BY variety
ORDER BY 1,2 DESC