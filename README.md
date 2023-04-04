# ETL con Python y Pentaho
Este es un pequeño proyecto para el [curso de fundamentos etl de platzi](https://platzi.com/cursos/fundamentos-etl/ "curso de fundamentos etl de platzi"). En este proyecto, tendremos datos de difrentes fuentes (SQL, JSON y CSV) los cuales deberemos extraer y traformar usando Python y Pentaho (ambas herramientas se pueden usar para lo mismo, pero a su manera). Cuando los daots esten limpios, pueden ser cargados para un mejor analisis.

## Contenido
- [Requisitos](#Requisitos)
- [Instalacion](#Instalacion)
- [Ejecucion](#Ejecucion)
- [Autor](#Autor)
- [Licencia](#Licencia)

## Requisitos
   - [Python](https://www.python.org/downloads/ "Python")
   - [Pentaho Data Integration Community Edition](https://www.hitachivantara.com/en-us/products/dataops-software/data-integration-analytics/pentaho-community-edition.html)
   - [Docker](https://docs.docker.com/get-docker/)
   - [Anaconda/miniconda](https://docs.anaconda.com/anaconda/install/)

Nota: este proyecto lo ejecute en en una laptop con Xubuntu 22.04 y en otra laptop con Xubuntu 18.04

## Instalacion
  1. Crea la carpeta en donde estara el proyecto: `mkdir fundamentos-etl`
  2. Descarga/clona el repo: `git clone https://github.com/carchobe/fundamentos-etl-platzi.git`
  3. Crea el ambiente virtual usando Anaconda o miniconda e instala las dependencias:
  - para una pc con 64bits:
   `conda create --name py-etl --file etl-env64.txt`
  - para una pc con 32bits:
   `conda create --name py-etl --file etl-env32.txt`
  -  ….O tambien puedes crear el ambiente y usar las verisones mas recientes de los paquetes necesarios con el comando: `conda create -name py-etl pandas jupyter sqlalchemy psycopg2 boto3 pip`
   Activa el ambiente con `conda activate py-etl`
   Cuando termines de ejecutar todo el proyecto, desactiva el ambiente con `conda deactivate`.

## Ejecucion
1. Ubicate en la carpeta del proyecto
2. Abre la terminal y descarga la imagen de PosrgreSQL con el comando:
`docker image pull postgres:13.9`
3. Construye la imagen con el comando: 
`docker build -t postgres:etl .`
4. Ya con la imagen terminada, enciende el contenedor con :
`docker compose up -d`
5. Con el contenedor ejecutandose, entra a la terminal de PSQL ejecutando el comando 
`docker compse exec db psql`
6. Dentro de PSQL,  ejecuta el comando 
`\i sources/public_trades_small.sql`
Con este comando estas importando la base datos SQL hacia PostgreSQL, esto puede taradar.
7. Listo, la base de datos esta cargada. puedes salirte de la terminal de PSQL escribiendo `exit`

Ya la base de datos esta cargada y el contenedor esta ejecutandose. Ahora ya puedes abrir la jupyter notebook para ejecutar los pasos del proyecto usando una de dos formas. (Recuerda que tanto el entorno virtual de anaconda y el contenedor de PostgreSQL deben estar activados)
   1. Desde Vscode con la extension de jupter notebooks 
   2. Desde la teminal usando el comando `jupyter notebook`
   

------------

Para apagar el contenedor recuerda ejecutar el comando `docker compose down`.

## Licencia
[Licencia MIT](https://choosealicense.com/licenses/mit/)
