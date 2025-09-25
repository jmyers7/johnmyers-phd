import scipy.stats as ss
import numpy as np

np.random.seed(42)

params = [{"loc": 10, "scale": 1}, {"loc": 15, "scale": 2}, {"loc": 21, "scale": 0.5}]
probs = [0.2, 0.7, 0.1]

n_samples = 1000
y_samples = np.random.choice(params, size=n_samples, p=probs)
x_samples = np.array([ss.norm(**param).rvs() for param in y_samples])

np.save('data.npy', x_samples)

# mesh = np.linspace(-3, 13, num=200)
# _, ax = plt.subplots()

# for param in params:
#   X = ss.norm(**param)
#   ax.plot(mesh, X.pdf(mesh), color=yellow)

# ax.set_xlabel('x')
# ax.set_ylabel('density')
# ax.set_title('gaussian components')
# plt.tight_layout()
# plt.show()

# def mixture_pdf(x):  
#   return sum([prob * ss.norm(**param).pdf(x) for prob, param in zip(probs, params)])

# _, ax = plt.subplots()
# ax.plot(mesh, mixture_pdf(mesh))
# ax.set_xlabel('x')
# ax.set_ylabel('density')
# ax.set_title('mixture pdf')
# plt.tight_layout()
# plt.show()

# n_samples = 1000
# c_samples = np.random.choice(params, size=n_samples, p=probs)
# x_samples = [ss.norm(**param).rvs() for param in c_samples]

# _, ax = plt.subplots()
# sns.histplot(data=x_samples, color=yellow, alpha=0.5, ec=grey, bins=40, stat='density', label='samples')
# ax.plot(mesh, mixture_pdf(mesh), color=blue, label='mixture PDF')
# ax.set_xlabel('x')
# ax.set_ylabel('density')
# ax.set_title('sample distribution + pdf')
# ax.legend()
# plt.show()