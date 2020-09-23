local macros = import '../common/macros.jsonnet';

macros + {
    run+: {
        run_on_yarn: true
    },
    mlflow+: {
        use_mlflow: true
    },
    params+: {
        target_ratio: null,
        num_negatives: null,
        loss: "multi",
        dim: 100,
        train_embeddings: true,
        normalize_embeddings: false,
    }
}
