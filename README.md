# A novel L0 minimization framework of tensor tubal rank and its multi-dimensional image completion application
[Jin-Liang Xiao](https://jin-liangxiao.github.io/), Ting-Zhu Huang*, [Liang-Jian Deng](https://liangjiandeng.github.io/)*, Hong-Xia Dou

[Inverse Problems and Imaging](https://www.aimsciences.org/article/doi/10.3934/ipi.2024018)


**My Homepage:** https://jin-liangxiao.github.io/

# Main results

-**Constraint comparison of different approaches**

<div align="center">
<img src=https://github.com/Jin-liangXiao/Jin-liangXiao.github.io/blob/main/assets/img/IPI_1.png width=60% alt="ipi1"> 
</div>

-**The sparsity of singular values of X is effectively enhanced by the adaptive transformation.**

<div align="center">
<img src=https://github.com/Jin-liangXiao/Jin-liangXiao.github.io/blob/main/assets/img/IPI_2.png width=80% alt="ipi2"> 
</div>


# How to use?
- Directly run: ``Demo.m`` 

# Parameters

  | Parameters | Meaning | Adjustment scope |
  | :-----:| :----: | :----: |
  | **mu_1** | Penalty parameter | [1e-6,1e-2] |
  | **alpha, beta** | Parameters of L0 minimization | [1e-4,1e-1], [1e1,1e4] |
  | **rho** | Control the extent of mu_1 increase  | [1,1.4] |
  | **mu_2** | Parameter of the proximal term of adaptive transformation | [1,1e4] |
  | **r** | Parameter of adaptive transformation | [10,n3] |

  Note that n3 is the third dimention of the image.

**Please adjust the above parameters for better results**
 
# Citation
```bibtex
@article{xiao2024ipi,
title = {A novel $ \ell_{0} $ minimization framework of tensor tubal rank and its multi-dimensional image completion application},
author = {Xiao, Jin-Liang and Huang, Ting-Zhu and Deng, Liang-Jian and Dou, Hong-Xia},
journal = {Inverse Problems and Imaging},
pages = {},
year = {2024},
issn = {1930-8337},
doi = {10.3934/ipi.2024018},
}
```
