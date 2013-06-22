<?php

/**
 * @param string $string ԭ�Ļ������� 
 * @param string $operation ����(ENCODE | DECODE), Ĭ��Ϊ DECODE 
 * @param string $key ��Կ 
 * @param int $expiry ������Ч��, ����ʱ����Ч�� ��λ �룬0 Ϊ������Ч 
 * @return string ������� ԭ�Ļ��� ���� base64_encode ����������� 
 * 
 * @example 
 * 
 * $a = authcode('abc', 'ENCODE', 'key'); 
 * $b = authcode($a, 'DECODE', 'key');  // $b(abc) 
 * 
 * $a = authcode('abc', 'ENCODE', 'key', 3600); 
 * $b = authcode('abc', 'DECODE', 'key'); // ��һ��Сʱ�ڣ�$b(abc)������ $b Ϊ�� 
 */
class AuthString 
{
    public function init()
    {
        //parent::init();
    }
    /**
     * auth 
     * save to database
     */
    public function authcode($string, $operation = 'DECODE', $key = '', $expiry = 3600)
    {

        $ckey_length = 4;
        // �����Կ���� ȡֵ 0-32;
        // ���������Կ���������������κι��ɣ�������ԭ�ĺ���Կ��ȫ��ͬ�����ܽ��Ҳ��ÿ�β�ͬ�������ƽ��Ѷȡ�
        // ȡֵԽ�����ı䶯����Խ�����ı仯 = 16 �� $ckey_length �η�
        // ����ֵΪ 0 ʱ���򲻲��������Կ


        $key = md5($key ? $key : 'key'); //���������дĬ��keyֵ
        $keya = md5(substr($key, 0, 16));
        $keyb = md5(substr($key, 16, 16));
        $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length) :
            substr(md5(microtime()), -$ckey_length)) : '';

        $cryptkey = $keya . md5($keya . $keyc);
        $key_length = strlen($cryptkey);

        $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) :
            sprintf('%010d', $expiry ? $expiry + time() : 0) . substr(md5($string . $keyb),
            0, 16) . $string;
        $string_length = strlen($string);

        $result = '';
        $box = range(0, 255);

        $rndkey = array();
        for ($i = 0; $i <= 255; $i++) {
            $rndkey[$i] = ord($cryptkey[$i % $key_length]);
        }

        for ($j = $i = 0; $i < 256; $i++) {
            $j = ($j + $box[$i] + $rndkey[$i]) % 256;
            $tmp = $box[$i];
            $box[$i] = $box[$j];
            $box[$j] = $tmp;
        }

        for ($a = $j = $i = 0; $i < $string_length; $i++) {
            $a = ($a + 1) % 256;
            $j = ($j + $box[$a]) % 256;
            $tmp = $box[$a];
            $box[$a] = $box[$j];
            $box[$j] = $tmp;
            $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
        }

        if ($operation == 'DECODE') {
            if ((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) &&
                substr($result, 10, 16) == substr(md5(substr($result, 26) . $keyb), 0, 16)) {
                return substr($result, 26);
            } else {
                return '';
            }
        } else {
            return $keyc . str_replace('=', '', base64_encode($result));
        }

    }
}