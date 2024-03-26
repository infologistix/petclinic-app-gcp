# The PetClinic Helm Chart

Helm Chart for L-Bank purposes.

Konfiguration der (native -> kein JVM!) Anwendung mittels Environment. Dafür ist in den Values unter `deployment.datasource` die entsprechende Konfiguration zu hinterlegen.

Ebenfalls wichtig ist die Angabe der Pfade und der entsprechenden Konfigruationen des Hosts.

```yaml
ingress:
    enabled: true
    host: <domain>
    path: /petclinic # <- oder hier ein alternativer Pfad für die Erreichbarkeit.
```

## Debugging the Error

Mittels Flag wird der Service Entry verändert, sodass die Datenbank nicht mehr erreicht werden kann. Dadurch fällt die Datenbank weg und die Anwendung funktioniert nicht mehr richtig.

`.debug.no_db=true` Damit kann per Flag der Fehler provoziert werden. 
