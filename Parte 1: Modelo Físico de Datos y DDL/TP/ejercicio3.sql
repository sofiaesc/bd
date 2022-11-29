--SELECT * FROM Departamento;
--SELECT * FROM Dispositivo;
--SELECT * FROM Persona;
--SELECT * FROM Area;

-- TABLA DISPOSITIVO: Hay que mantener los datos.
ALTER TABLE Dispositivo
	add column codigoArea int4;
UPDATE Dispositivo 
	SET codigoArea = (SELECT codigoArea FROM Area A
				WHERE Dispositivo.id_area = A.id);

ALTER TABLE Dispositivo
	drop constraint fk_dispositivo_references_area;
drop index idx_dispositivo_area;

ALTER TABLE Dispositivo
	drop column id_area;
ALTER TABLE Dispositivo
	add constraint fk_dispositivo_references_area foreign key (codigoArea) references Area(codigoArea);
	
ALTER TABLE Dispositivo -- agrego not null una vez que ya le pasé los valores.
	ALTER COLUMN codigoArea SET not null;
	
create index idx_dispositivo_area on Dispositivo(codigoArea);

-- TABLA PERSONA: Puedo droppear sin problemas.
ALTER TABLE Persona
	add column codigoDepto int4 not null;
UPDATE Persona
	SET codigoDepto = (SELECT codigoDepto FROM Departamento
				WHERE Persona.id_departamento = Departamento.id);

ALTER TABLE Persona
	drop constraint fk_persona_references_departamento;
drop index idx_persona_departamento;

ALTER TABLE Persona
	drop column id_departamento;
ALTER TABLE Persona
	add constraint fk_persona_references_departamento foreign key (codigoDepto) references Departamento(codigoDepto);

create index idx_persona_departamento on Persona(codigoDepto);

-- TABLA DEPARTAMENTO:
ALTER TABLE Departamento
	add column codigoDeptoNivelSuperior int4;
UPDATE Departamento
	SET codigoDeptoNivelSuperior = (SELECT codigoDepto FROM Departamento D2
				WHERE Departamento.idDeptoNivelSuperior = D2.id);

ALTER TABLE Departamento
	drop constraint fk_departamento_references_departamento;
ALTER TABLE Departamento
	drop constraint pk_departamento;
	
ALTER TABLE Departamento
	drop column id;
ALTER TABLE Departamento
	drop column idDeptoNivelSuperior;

ALTER TABLE Departamento
	add constraint pk_departamento primary key (codigoDepto);
ALTER TABLE Departamento
	add constraint fk_departamento_references_departamento foreign key (codigoDeptoNivelSuperior) references Departamento(codigoDepto);

-- TABLA AREA:
ALTER TABLE Area
	add column codigoAreaNivelSuperior int4;
UPDATE Area
	SET codigoAreaNivelSuperior = (SELECT codigoArea FROM Area A2
				WHERE Area.idAreaNivelSuperior = A2.id);

ALTER TABLE Area
	drop constraint fk_area_references_area;
ALTER TABLE Area
	drop constraint pk_area;
	
ALTER TABLE Area
	drop column id;
ALTER TABLE Area
	drop column idAreaNivelSuperior;

ALTER TABLE Area
	add constraint pk_area primary key (codigoArea);
ALTER TABLE Area
	add constraint fk_area_references_area foreign key (codigoAreaNivelSuperior) references Area(codigoArea);