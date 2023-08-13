# ETL con Python y Pentaho
Este es un pequeño proyecto para el [curso de fundamentos etl de platzi](https://platzi.com/cursos/fundamentos-etl/ "curso de fundamentos etl de platzi"). En este proyecto, tendremos datos de difrentes fuentes (SQL, JSON y CSV) los cuales deberemos extraer y traformar usando Python y Pentaho (ambas herramientas se usaran para lo mismo, pero a su manera). Cuando los datos esten limpios, pueden ser cargados para un mejor analisis.

Ambos metodos de ejecucion son independientes uno del otro.

![Captura de pantalla_2023-04-06_21-32-16](https://user-images.githubusercontent.com/99220263/230528848-b67632c2-337e-4614-bd3d-ef2b58695dec.png)

## Contenido
- [Requisitos](#Requisitos)
- [Instalacion](#Instalacion)
- [Ejecucion en Jupyter](#Ejecucion-Jupyter)
- [Ejecucion en Pentaho](#Ejecucion-Pentaho)
- [Cierre](#Cierre)
- [Licencia](#Licencia)

## Requisitos
   - [Python](https://www.python.org/downloads/ "Python")
   - [Pentaho Data Integration Community Edition](https://www.hitachivantara.com/en-us/products/dataops-software/data-integration-analytics/pentaho-community-edition.html)
   - [Docker](https://docs.docker.com/get-docker/)
   - [Anaconda/miniconda](https://docs.anaconda.com/anaconda/install/)

Nota: este proyecto lo ejecute en en una laptop con Xubuntu 22.04 (64bits) y en otra laptop con Xubuntu 18.04 (32 bits)

## Instalacion
  1. Crea la carpeta en donde estara el proyecto: `mkdir fundamentos-etl`
  2. Descarga/clona el repo: `git clone https://github.com/carchobe/fundamentos-etl-platzi.git`
  3. Crea el ambiente virtual usando Anaconda o miniconda e instala las dependencias:
  - para una pc con 64bits:
   `conda create --name py-etl --file etl-env64.txt`
  - para una pc con 32bits:
   `conda create --name py-etl --file etl-env32.txt`
  -  ….O tambien puedes crear el ambiente y usar las verisones mas recientes de los paquetes necesarios con el comando: `conda create --name py-etl pandas jupyter sqlalchemy psycopg2 pip`
  4. Activa el ambiente con `conda activate py-etl`
  5. Cuando termines de ejecutar todo el proyecto, desactiva el ambiente con `conda deactivate`.

## Ejecucion Jupyter
1. Ubicate en la carpeta del proyecto
2. Abre la terminal y descarga la imagen de PosrgreSQL con el comando:
`docker image pull postgres:13.9`
3. Construye la imagen con el comando: 
`docker build -t postgres:etl .`
4. Ya con la imagen terminada, enciende el contenedor con:
`docker compose up -d`
5. Con el contenedor ejecutandose, entra a la terminal de PSQL ejecutando el comando 
`docker compose exec db psql`
6. Dentro de PSQL,  ejecuta el comando 
`\i sources/public_trades_small.sql`
Con este comando estas importando la base datos SQL hacia PostgreSQL, esto puede tardar.
7. Listo, la base de datos esta cargada. puedes salirte de la terminal de PSQL escribiendo `exit`

Ya la base de datos esta cargada y el contenedor esta ejecutandose. Ahora ya puedes abrir la jupyter notebook para ejecutar los pasos del proyecto usando una de dos formas. (Recuerda que tanto el entorno virtual de anaconda y el contenedor de PostgreSQL deben estar activados)
   1. Desde Vscode con la extension de jupyter notebooks 
   2. Desde la teminal usando el comando `jupyter notebook`
   
Cuando la notebook se ejecute, tendras la tabla final en dos ubicaciones distintas:
1. En el contenedor de postgresql con el nombre *trades_final*. Puedes revisarla metiendote en el contenedor con `docker compose exec db psql`.
2. En un archivo CSV que se creara en la carpeta principal del proyecto.
   
## Ejecucion Pentaho

1. Haz todos los pasos de la seccion de Ejecucion de Jupyter hasta el paso 4.
2. Dentro de PSQL,  ejecuta el comando 
`\i sources/final_pentaho_script.sql`
3. Si ya instalaste Pentaho, solo debes ejecutarlo abriendo el archivo `spoon.sh` desde la terminal.
```
./spoon.sh
```
4. Una vez abierto, tienes que configurar la conexion al contenedor de postgres:
   - En `view`, haz click derecho en la `database connections`.
   - Escoge el tipo de conexion PostgreSQL y llena todas las lineas con los datos que ya estan en el `docker-compose.yml`. En HOSTNAME, pones localhost.
5. Todo deberia estar listo para empezar. Ejecuta el proyecto en el boton RUN.
6. Si todo sale bien, el proceso ETL creara una nueva TABLE en el contenedor de postgresql. Esta nueva TABLE tiene la Informacion limpia y preparada para analizar.
7. Si quieres, puedes meterte en PSQL y revisar la base datos limpia.
```
docker compose exec db psql
```
y luego...
```
SELECT * FROM pentaho_ETLDB;
```

## Cierre

Al terminar de ejecutar el proyecto, sigue los siguientes pasos para borrar todo:
1. Para apagar el contenedor recuerda ejecutar el comando `docker compose down`.
2. Elimina el volumen con la informacion del contenedor con el comando `docker volume rm pgdata`
3. Elimina la imagen que se creo con el comando `docker image rm postgres:elt`

## Licencia
[Licencia MIT](https://choosealicense.com/licenses/mit/)
