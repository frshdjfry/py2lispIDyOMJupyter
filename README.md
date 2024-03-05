## Quick Start with JupyterLab & IDyOM

This setup consists of a Bash script paired with a Dockerfile, designed to facilitate the easy startup of a JupyterLab environment with IDyOM pre-installed. The Dockerfile creates an isolated, containerized environment where all necessary dependencies, including IDyOM and its prerequisites, are automatically configured and installed. Upon running the Bash script, it builds the Docker image based on this Dockerfile and then launches a JupyterLab instance. The script ensures the JupyterLab server is accessible with all IDyOM functionalities integrated.

### Installation Steps:

1. **Install Docker**: [Get Docker](https://docs.docker.com/get-docker/)
2. **Clone the Repository**: Clone this repo to your local machine.
3. **Make the Script Executable**:
`chmod +x start_docker.sh`
4. **Launch JupyterLab**:
`./start_docker.sh`
5. **Access JupyterLab**:
- Open JupyterLab in your browser: [http://127.0.0.1:8888/lab/](http://127.0.0.1:8888/lab/)
- For a quick start, navigate to: [Tutorial Notebook](http://127.0.0.1:8888/lab/workspaces/auto-H/tree/example_usage.ipynb)

### List of harmonic viewpoints that are available to use:

| Viewpoint Keyword             | Description with Arithmetic Explanations                                                                                   | Reference                                                                                                                                                                                                                                                      |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `h-cpitch-class`              | Converts harmonic events to pitch classes using modulo 12, making them octave invariant.                                    | Harrison (2019, Ch. 2, 4)                                                                                                                                                                                                                                      |
| `pi-chord`                    | Represents the chromatic pitch of chords in ascending order.                                                                |                                                                                                                                                                                                                                                                |
| `pi-chord-type`               | Calculates pitch chord relative to the bass note, providing transpositional equivalence by subtracting the bass note pitch. |                                                                                                                                                                                                                                                                |
| `pc-chord`                    | Forms pitch-class chords with specified bass note, excluding duplicate pitches, sorted in ascending order.                   |                                                                                                                                                                                                                                                                |
| `pc-chord-type`               | Adjusts pitch-class chords relative to the bass note (mod 12) and sorts them in ascending order.                            |                                                                                                                                                                                                                                                                |
| `pc-chord-rel-prev-bass`      | Adjusts pitch-class chords relative to the previous bass note (mod 12) and sorts them in ascending order.                   |                                                                                                                                                                                                                                                                |
| `pc-set`                      | Represents pitch-class sets without duplicates, in ascending order.                                                         |                                                                                                                                                                                                                                                                |
| `pc-set-type`                 | Finds the normal form (most compact ordering) of a pitch-class set and adjusts pitches relative to the bass note (mod 12).  |                                                                                                                                                                                                                                                                |
| `pc-set-rel-bass`             | Similar to `pc-chord-type`, adjusts pitch-class sets relative to the bass note (mod 12).                                    |                                                                                                                                                                                                                                                                |
| `pc-set-rel-prev-bass`        | Adjusts pitch-class sets relative to the previous bass note (mod 12) and sorts them in ascending order.                     |                                                                                                                                                                                                                                                                |
| `pc-set-rel-root`             | Adjusts pitch-class sets relative to the chord root (mod 12) and sorts them in ascending order.                             |                                                                                                                                                                                                                                                                |
| `bass-pc`                     | Extracts the bass pitch class from a chord.                                                                                 |                                                                                                                                                                                                                                                                |
| `bass-int`                    | Calculates the interval between the current and previous bass pitch classes (mod 12).                                       |                                                                                                                                                                                                                                                                |
| `bass-pc-rel-root`            | Adjusts the bass pitch class relative to the chord root (mod 12).                                                           |                                                                                                                                                                                                                                                                |
| `sd-set`                      | Adjusts pitch-class sets to scale degrees relative to a referent (tonic), using modulo 12.                                  |                                                                                                                                                                                                                                                                |
| `bass-sd`                     | Adjusts the bass pitch class to a scale degree relative to a referent (tonic), using modulo 12.                             |                                                                                                                                                                                                                                                                |
| `root-sd`                     | Adjusts the root pitch class to a scale degree relative to a referent (tonic), using modulo 12.                             |                                                                                                                                                                                                                                                                |
| `pi-chord-identity`           | Checks for identical chromatic pitches between the last two chords in a sequence.                                           |                                                                                                                                                                                                                                                                |
| `pc-chord-identity`           | Checks for identical pitch-class chords between the last two events in a sequence.                                          |                                                                                                                                                                                                                                                                |
| `pc-set-identity`             | Checks for identical pitch-class sets between the last two events in a sequence.                                            |                                                                                                                                                                                                                                                                |
| `root-pc`                     | Determines the root pitch class of a chord using Parncutt's root-finding model.                                             | Parncutt's Root Finding Model (1988)                                                                                                                                                                                                                           |
| `root-int`                    | Calculates the interval between the current and previous root pitch classes (mod 12).                                       |                                                                                                                                                                                                                                                                |
| `parn88-root`              | Root pitch class based on the Parncutt (1988) root-finding model.                                       |                                                                                                                                                                                                                                                                |
| `vintcc`                      | Forms interval class combinations from the lowest note, excluding doublings and allowing permutations.                       | Sears et al. (2018, 2019)                                                                                                                                                                                                                                      |
| `csdc`                        | Forms chromatic scale degree combinations, excluding doublings and allowing permutations in upper parts.                     | Sears et al. (2018, 2019)                                                                                                                                                                                                                                      |
| `gct-root`, `gct-chord-type`, `gct` | General Chord Type representations, including root and chord type, based on a tonal consonance vector.           | [General Chord Type (GCT) representations (Giannis & Cambouropoulos, 2021)](https://www.researchgate.net/publication/283070302_EVALUATING_THE_GENERAL_CHORD_TYPE_REPRESENTATION_IN_TONAL_MUSIC_AND_ORGANISING_GCT_CHORD_LABELS_IN_FUNCTIONAL_CHORD_CATEGORIES) |

### Based on:

- IDyOM Project: [GitHub - mtpearce/idyom](https://github.com/mtpearce/idyom)
- Py2lispIDyOM: [GitHub - xinyiguan/py2lispIDyOM](https://github.com/xinyiguan/py2lispIDyOM)
