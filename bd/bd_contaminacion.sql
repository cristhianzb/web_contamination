CREATE TYPE sexo AS ENUM ('mujer','otro','varon'); 
-- -------------------------------------------------------------------------
-- PostgreSQL SQL create tables
-- exported at Sun Nov 19 23:18:31 BOT 2017 with easyDesigner
-- -------------------------------------------------------------------------

-- -------------------------------------------------------------------------
-- Table: persona
-- -------------------------------------------------------------------------
CREATE TABLE "persona" (
  "id" SERIAL NOT NULL,
  "ci" VARCHAR NULL,
  "nombre" VARCHAR NULL,
  "ap_paterno" VARCHAR NULL,
  "ap_materno" VARCHAR NULL,
  "fecha_nac" DATE NULL,
  "direccion" VARCHAR NULL,
  "sexo" SEXO NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: estacion
-- -------------------------------------------------------------------------
CREATE TABLE "estacion" (
  "id" SERIAL NOT NULL,
  "direccion" VARCHAR NULL,
  "latitud" FLOAT NULL,
  "longitud" FLOAT NULL,
  "altitud" FLOAT NULL,
  "fecha_ini" DATE NULL,
  "activo" BOOL NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: equipo
-- -------------------------------------------------------------------------
CREATE TABLE "equipo" (
  "id" SERIAL NOT NULL,
  "estacion_id" SERIAL NOT NULL,
  "modelo_id" SERIAL NOT NULL,
  "tipo_id" SERIAL NOT NULL,
  "fecha_adquisicion" DATE NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: tipo
-- -------------------------------------------------------------------------
CREATE TABLE "tipo" (
  "id" SERIAL NOT NULL,
  "nombre" VARCHAR NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: modelo
-- -------------------------------------------------------------------------
CREATE TABLE "modelo" (
  "id" SERIAL NOT NULL,
  "nombre" VARCHAR NULL,
  "numero_serial" VARCHAR NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: registro
-- -------------------------------------------------------------------------
CREATE TABLE "registro" (
  "medicion_fecha" DATE NOT NULL,
  "medicion_equipo_id" SERIAL NOT NULL,
  "medicion_contaminante_id" SERIAL NOT NULL,
  "tiempo" TIME NOT NULL,
  "valor" FLOAT NULL,
  PRIMARY KEY ("medicion_fecha", "medicion_equipo_id", "medicion_contaminante_id", "tiempo")
);

-- -------------------------------------------------------------------------
-- Table: asignacion
-- -------------------------------------------------------------------------
CREATE TABLE "asignacion" (
  "equipo_id" SERIAL NOT NULL,
  "persona_id" SERIAL NOT NULL,
  "fecha_ini" DATE NOT NULL,
  "fecha_fin" DATE NULL,
  PRIMARY KEY ("equipo_id", "persona_id", "fecha_ini")
);

-- -------------------------------------------------------------------------
-- Table: contaminante
-- -------------------------------------------------------------------------
CREATE TABLE "contaminante" (
  "id" SERIAL NOT NULL,
  "nombre" VARCHAR NULL,
  "descripcion" VARCHAR NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: unidad
-- -------------------------------------------------------------------------
CREATE TABLE "unidad" (
  "id" SERIAL NOT NULL,
  "nombre" VARCHAR NULL,
  "descripcion" VARCHAR NULL,
  PRIMARY KEY ("id")
);

-- -------------------------------------------------------------------------
-- Table: parametro
-- -------------------------------------------------------------------------
CREATE TABLE "parametro" (
  "id" SERIAL NOT NULL,
  "equipo_id" SERIAL NOT NULL,
  "contaminante_id" SERIAL NOT NULL,
  PRIMARY KEY ("id", "equipo_id")
);

-- -------------------------------------------------------------------------
-- Table: medicion
-- -------------------------------------------------------------------------
CREATE TABLE "medicion" (
  "fecha" DATE NOT NULL,
  "equipo_id" SERIAL NOT NULL,
  "contaminante_id" SERIAL NOT NULL,
  "unidad_id" SERIAL NOT NULL,
  PRIMARY KEY ("fecha", "equipo_id", "contaminante_id")
);

-- -------------------------------------------------------------------------
-- Relations for table: equipo
-- -------------------------------------------------------------------------
ALTER TABLE "equipo" ADD FOREIGN KEY ("tipo_id") 
    REFERENCES "tipo" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "equipo" ADD FOREIGN KEY ("modelo_id") 
    REFERENCES "modelo" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "equipo" ADD FOREIGN KEY ("estacion_id") 
    REFERENCES "estacion" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: registro
-- -------------------------------------------------------------------------
ALTER TABLE "registro" ADD FOREIGN KEY ("medicion_fecha", "medicion_equipo_id", "medicion_contaminante_id") 
    REFERENCES "medicion" ("fecha", "equipo_id", "contaminante_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: asignacion
-- -------------------------------------------------------------------------
ALTER TABLE "asignacion" ADD FOREIGN KEY ("equipo_id") 
    REFERENCES "equipo" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "asignacion" ADD FOREIGN KEY ("persona_id") 
    REFERENCES "persona" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: parametro
-- -------------------------------------------------------------------------
ALTER TABLE "parametro" ADD FOREIGN KEY ("contaminante_id") 
    REFERENCES "contaminante" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "parametro" ADD FOREIGN KEY ("equipo_id") 
    REFERENCES "equipo" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

-- -------------------------------------------------------------------------
-- Relations for table: medicion
-- -------------------------------------------------------------------------
ALTER TABLE "medicion" ADD FOREIGN KEY ("equipo_id") 
    REFERENCES "equipo" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "medicion" ADD FOREIGN KEY ("unidad_id") 
    REFERENCES "unidad" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;
ALTER TABLE "medicion" ADD FOREIGN KEY ("contaminante_id") 
    REFERENCES "contaminante" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION;

