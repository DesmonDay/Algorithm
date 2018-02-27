sp = sparse(train_data);
model = train(group, sp,'-c 1')
% group保存数据标签，sp为稀疏后的训练数据矩阵

[predict_label, accuracy, dec_values] = predict(label, test, model);
% label为验证集标签，test为稀疏后的验证数据矩阵