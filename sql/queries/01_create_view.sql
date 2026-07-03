CREATE VIEW IF NOT EXISTS apartments AS
SELECT 
    Title,
    Location,
    Rooms,
    [Shower Rooms],
    Area,
    [Housing stock],
    Price,
    Floor,
    Heating,
    [Has furniture],
    [Has AC],
    [Has underfloor heating],
    [Has double glazed windows],
    URL
FROM real_estate
WHERE Type LIKE '%Apartament%'
  AND Price IS NOT NULL;