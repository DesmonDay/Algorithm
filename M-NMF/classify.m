sp = sparse(train_data);
model = train(group, sp,'-c 1')
% group�������ݱ�ǩ��spΪϡ����ѵ�����ݾ���

[predict_label, accuracy, dec_values] = predict(label, test, model);
% labelΪ��֤����ǩ��testΪϡ������֤���ݾ���