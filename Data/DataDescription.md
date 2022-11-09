# The Data

## Data Sampling and Annotation

Our labelled dataset consists of 20,000 entries. Of these, 10,000 are sampled from Gab and 10,000 from Reddit. All entries are first labelled by three trained annotators and disagreements are adjudicated by one of two experts. For Task A, when the annotator votes are unanimous in favour of one label, this is taken as the gold label. If there is any disagreement, one of the experts reviews the entry and decides the gold label. For Task B and C, when at least two annotators agree on a label, this is taken as the gold label but in cases of 3-way disagreement, one of the experts decides the gold label. 

All annotators and experts were self-identifying women. We annotate our data under the “prescriptive paradigm”, as described by Röttger et al., by providing extensive and detailed annotation guidelines, regular feedback and training. For more information, see the Label Schema page.

## Training Data

The training data consists of 14,000 entries (70% split), of which 3,398 are sexist. There is a one CSV file containing labels for Task A, B and C. The columns are:

- rewire_id: a unique identifier for each entry
- text: the input text
- label_sexist: Task A label
- label_category: Task B label.
- label_vector: Task C label.

NOTE: For not sexist entries, label_category and label_vector are set to the string "none".

Auxiliary Unlabelled Data: To encourage and allow for innovative training techniques, we also released two further unlabelled datasets. Note that we sample the labelled instances from these pools, so the text column has been cleaned and prepared under the same procedure as the labelled data. The unlabelled data does not factor into any evaluation or scoring.

- Gab: 1 million entries with column text
- Reddit: 1 million entries with column text

## Development Data

The development data consists of 2,000 entries (10% split). It will be used in the Development Phase to score submissions. There are separate csv files for Task A, B and C. All development data will be available from September 1st 2022.

## Test Data

The test data consists of 4,000 entries (20% split). It will be used in the Test Phase to score submissions (release in January 2023). There are separate csv files for Task A, B and C. Test data for Task A will be released on January 10th 2023. Test data for Task B and C will be released on January 21st 2023. We are staggering their release because Task B and C are only relevant to the sexist content identified from Task A. This means that it is not possible to "game" the tasks.
