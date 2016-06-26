#!/usr/bin/env python

import tensorflow as tf
import numpy as np
from tensorflow.examples.tutorials.mnist import input_data

mnist = input_data.read_data_sets("data/", one_hot=True)
trainimg   = mnist.train.images
trainlabel = mnist.train.labels
testimg    = mnist.test.images
testlabel  = mnist.test.labels

learning_rate = 0.001
training_epochs = 100
batch_size = 256
display_step = 10

n_input = 784
n_classes = 10

n_hidden_1 = 256
n_hidden_2 = 128

x = tf.placeholder("float", [None, n_input])
y = tf.placeholder("float", [None, n_classes])

w1 = tf.Variable(tf.random_normal([n_input, n_hidden_1]))
w2 = tf.Variable(tf.random_normal([n_hidden_1, n_hidden_2]))
w3 = tf.Variable(tf.random_normal([n_hidden_2, n_classes]))
b1 = tf.Variable(tf.random_normal([n_hidden_1]))
b2 = tf.Variable(tf.random_normal([n_hidden_2]))
b3 = tf.Variable(tf.random_normal([n_classes]))

layer1 = tf.nn.sigmoid(tf.add(tf.matmul(x, w1), b1))
layer2 = tf.nn.sigmoid(tf.add(tf.matmul(layer1, w2), b2))
pred = (tf.sigmoid(tf.matmul(layer2, w3) + b3))

cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(pred, y))
optm = tf.train.AdamOptimizer(learning_rate=learning_rate).minimize(cost)



sess = tf.Session()

sess.run(tf.initialize_all_variables())

for epoch in range(training_epochs):

   batch_xs, batch_ys = mnist.train.next_batch(batch_size)
   sess.run(optm, feed_dict={x: batch_xs, y: batch_ys})

   if epoch % display_step == 0:
       cost_value = sess.run(cost, feed_dict={x: batch_xs, y: batch_ys})
       print("Epoch: {}, Cost: {}".format(epoch, cost_value))

sess.close()

