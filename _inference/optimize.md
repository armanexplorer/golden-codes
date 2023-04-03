---
title: Quantization & Layering to reduce memory fingerprint
---

Quantization and layer fusion are two techniques used in deep learning to optimize the performance and efficiency of inference systems. Here is a brief explanation of each technique:

Quantization:
- Quantization is the process of reducing the numerical precision of weights and activations in a deep learning model.
- The goal of quantization is to reduce the memory footprint and computational requirements of the model while maintaining its accuracy.
- There are different types of quantization, including post-training static quantization (PTQ), quantization-aware training (QAT), and dynamic quantization.
- PTQ quantizes the weights and activations of the model after training, while QAT quantizes the model during training.
- Dynamic quantization quantizes the weights of a network often to a lower precision than PTQ.

Layer Fusion:
- Layer fusion is the process of combining multiple layers of a deep learning model into a single layer.
- The goal of layer fusion is to reduce the computational requirements of the model while maintaining its accuracy.
- Layer fusion can be done in different ways, including fusing convolution and max-pooling layers, fusing batch normalization and activation layers, and fusing linear and ReLU layers.
- Layer fusion can be done before or after quantization, and it can be done manually or automatically using optimization algorithms.

Overall, quantization and layer fusion are important techniques for optimizing the performance and efficiency of deep learning models in inference systems. By reducing the memory footprint and computational requirements of the model, these techniques can improve the speed and accuracy of the system while reducing its energy consumption.

Citations:

[1] https://forums.developer.nvidia.com/t/tensorrt-explicit-quantization-layer-fusion/208983

[2] https://pytorch.org/tutorials/recipes/fuse.html

[3] https://pytorch.org/docs/stable/quantization.html

[4] https://arxiv.org/pdf/2006.10518.pdf

[5] https://proceedings.mlr.press/v157/o-neill21a/o-neill21a.pdf

[6] https://deepganteam.medium.com/three-flavors-of-quantization-cc5be18e7ab4