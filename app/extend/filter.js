const dayjs = require('dayjs');
// 时间过滤器
exports.date = (dateString, formatString) => {
  return dayjs(dateString)
    .format(formatString || 'YYYY-MM-DD');
};
