CREATE OR REPLACE FUNCTION layer_hydrants(bbox geometry, zoom_level int)
RETURNS TABLE(geometry geometry, type text) AS $$
    SELECT geometry, type
    FROM osm_hydranten_point
    WHERE zoom_level >= 10 AND geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;
