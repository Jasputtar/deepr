# pylint: disable=no-value-for-parameter,invalid-name,unexpected-keyword-arg
"""Multinomial Log Likelihood with Complementarity Sum Sampling."""

from typing import Tuple

import tensorflow as tf

from deepr.layers import base
from deepr.layers.reduce import Average


class MultiLogLikelihood(base.Layer):
    """Multinomial Log Likelihood."""

    def __init__(self, **kwargs):
        super().__init__(n_in=2, n_out=1, **kwargs)

    def forward(self, tensors: Tuple[tf.Tensor, tf.Tensor], mode: str = None):
        """Multinomial Log Likelihood

        Parameters
        ----------
        tensors : Tuple[tf.Tensor]
            - logits : shape = (batch, num_classes), tf.float32
            - classes : shape = (batch, num_classes), tf.int64 as a
            one-hot vector

        Returns
        -------
        tf.Tensor
            Negative Multinomial Log Likelihood, scalar
        """
        logits, classes = tensors
        log_softmax = tf.nn.log_softmax(logits)
        return -Average()(tf.reduce_sum(log_softmax * tf.cast(classes, tf.float32), axis=-1))