# FCRN-DepthPrediction
This program was remodeled by miu (miu200521358) forking [FCRN-DepthPrediction](https://github.com/iro-cp/FCRN-DepthPrediction)

Please check the above URL or [README-original.md](README-original.md) for details of operation.

## Functional overview

- The depth is estimated from the human skeleton detected by [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose).
- Based on the joint XY position information of [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) and depth estimation, human tracking is performed with multiple people tracing.

### Dependencies

Install the following in python series

- [OpenCV](http://opencv.org/)
- [tensorflow](https://www.tensorflow.org/) 1.0-1.6
- numpy
- python-dateutil
- pytz
- pyparsing
- six
- matplotlib
- opencv-python
- imageio
