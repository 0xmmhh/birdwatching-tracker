package pl.hawrot.birdwatchingapi.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@NoArgsConstructor
public class Species {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    @Id
    private Long id;

    @Column(nullable = false, length = 100)
    private String commonName;

    @Column(nullable = false, length = 150)
    private String latinName;
}
