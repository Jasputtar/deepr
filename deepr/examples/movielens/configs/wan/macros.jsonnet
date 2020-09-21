local path_dataset = "../ml-20m/";

{
    "run": {
        "run_on_yarn": false,
        "train_on_yarn": false
    },
    "paths": {
        "type": "deepr.examples.movielens.macros.Paths",
        "path_train": path_dataset + "train.csv",
        "path_eval_tr": path_dataset + "validation_tr.csv",
        "path_eval_te": path_dataset + "validation_te.csv",
        "path_test_tr": path_dataset + "test_tr.csv",
        "path_test_te": path_dataset + "test_te.csv",
        "path_root": "model"
    },
    "mlflow": {
        "type": "deepr.macros.MLFlowInit",
        "use_mlflow": false,
        "run_name": "$paths:run_name",
        "tracking_uri": null,
        "experiment_name": null,
        "artifact_location": null
    },
    "params": {
        "max_steps": 20,
        "batch_size": 512,
        "vocab_size": {
            "type": "deepr.vocab.size",
            "path": path_dataset + "unique_sid.txt"
        },
        "target_ratio": 0.2,
        "num_negatives": 100,
        "loss": "bpr"
    }
}
