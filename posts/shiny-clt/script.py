import scipy.stats as ss
import matplotlib.pyplot as plt
import numpy as np

plt.style.use('../../aux-files/custom-theme.mplstyle')

meanlog = 1
sdlog = 0.75
X = ss.lognorm(s=sdlog, scale=np.exp(meanlog))

x_grid = np.linspace(0, 13, num=250)

_, ax = plt.subplots()
ax.plot(x_grid, X.pdf(x_grid))
ax.set_title('log-normal distribution')
ax.set_xlabel('x')
ax.set_ylabel('density')
plt.tight_layout()
plt.show()