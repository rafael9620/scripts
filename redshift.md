# Redshift


##### Havana configuration
```bash
redshift -m randr -l 23.135305:-82.3589631 -t 6500K:4500K

# -l LAT:LON      Your current location
# -m METHOD       Method to use to set color temperature
# -t DAY:NIGHT    Color temperature to set at daytime/night
# -O TEMP         One shot manual mode (set color temperature)
# -x              Reset mode (remove adjustment from screen)

# HAVANA
# Latitude:   23.135305
# Longitude: -82.3589631

# DEFAULT VALUES
# Daytime temperature: **5500K**
# Night temperature: **3500K**
```

##### Reset configuration
```bash
redshift -x       # The neutral temperature is **6500K**.
```

##### Set temperature example
```bash
redshift -O 2500K # Very hot screen temperature.
```
