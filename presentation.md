# Einleitung

- Duis autem vel eum
- iriure dolor in hendrerit

![Cool Caption](figures/bpmn-sota){#fig:bpmn-sota}


# Grundlagen



|     .    | Tweedledee   | Tweedledum      |
|----------|--------------|-----------------|
| Age      | 14           | 14              |
| Height   | 3'2"         | 3'2"            |
| Politics | Conservative | Conservative    |
| Religion | New Age      | Syrian Orthodox |



# Forschungsstand

- Blub
- Bla 
- Bla


# Konzeption

- Blub
- Bla 
- Bla


# Implementation

```{.java caption="Signifikanztest für Sensorwerte" label="lst:significance"}
boolean isSignificant(String state, String name) {
    double number = Double.valueOf(state);
    double last = normal.getOrDefault(name, Double.MIN_VALUE);
    double max = maximum.getOrDefault(name, Double.MIN_VALUE);

    if (max < number) {
        maximum.put(name, number);
        max = number;
    }

    double current = (number / max);
    normal.put(name, current);

    if (current == last && last == 1.0) return true;
    else return abs(current - last) > delta;
}
```

# Evaluation

- Blub
- Bla 
- Bla


# Zusammenfassung

- Blub
- Bla 
- Bla

