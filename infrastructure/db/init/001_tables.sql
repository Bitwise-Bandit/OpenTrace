CREATE EXTENSION IF NOT EXISTS postgis;

create table levels (
	id SERIAL primary key,
	building_name TEXT not null,
	level_number INTEGER not null,
	label TEXT 
);

create table nodes(
	id SERIAL primary key,
	level_id INTEGER references levels(id),
	name TEXT,
	category TEXT,
	geom GEOMETRY(Point, 4326)
);

create table edges(
	id SERIAL primary key,
	level_id INTEGER references  levels(id),
	source_node_id INTEGER references nodes(id),
	target_node_id INTEGER references nodes(id),
	distance_meters FLOAT,
	geom GEOMETRY(LineString, 4326)
);