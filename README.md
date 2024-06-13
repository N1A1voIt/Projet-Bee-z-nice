# Projet-Bee-z-nice
The project is an angular spring boot project.
Database dump is inside restauDump.sql 
    Open cli and type the following commands:
        -psql -U postgres -d postgres
        -CREATE USER restau WITH SUPERUSER PASSWORD 'root';
        -CREATE DATABASE restau WITH OWNER restau;
        -exit;
        -psql -U restau -d restau -f restauDump.sql
    If you are using vscode if you want to run spring boot you'll have to install apache-maven-xx (xx is the maven version)
    In intelliJ you just have to run it
    To set up the angular project you'll have to run: 
        ```
        npm install
        ```
    and then run 
        ```
        ng serve
        ```