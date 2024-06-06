package com.gydblog.monitor.controller;

import com.gydblog.common.constant.CacheConstants;
import com.gydblog.common.domain.R;
import com.gydblog.common.utils.StringUtils;
import com.gydblog.common.domain.SysCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 缓存监控
 * 
 * @author gyd
 */
@RestController
@RequestMapping("/monitor/cache")
public class CacheController
{
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    private final static List<SysCache> caches = new ArrayList<SysCache>();
    {
        caches.add(new SysCache(CacheConstants.LOGIN_TOKEN_KEY, "用户信息"));
        caches.add(new SysCache(CacheConstants.SYS_CONFIG_KEY, "配置信息"));
        caches.add(new SysCache(CacheConstants.SYS_DICT_KEY, "数据字典"));
        caches.add(new SysCache(CacheConstants.CAPTCHA_CODE_KEY, "验证码"));
        caches.add(new SysCache(CacheConstants.REPEAT_SUBMIT_KEY, "防重提交"));
        caches.add(new SysCache(CacheConstants.RATE_LIMIT_KEY, "限流处理"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码错误次数"));
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @GetMapping()
    public R getInfo() throws Exception
    {
        Properties info = (Properties) redisTemplate.execute((RedisCallback<Object>) connection -> connection.info());
        Properties commandStats = (Properties) redisTemplate.execute((RedisCallback<Object>) connection -> connection.info("commandstats"));
        Object dbSize = redisTemplate.execute((RedisCallback<Object>) connection -> connection.dbSize());

        Map<String, Object> result = new HashMap<>(3);
        result.put("info", info);
        result.put("dbSize", dbSize);

        List<Map<String, String>> pieList = new ArrayList<>();
        commandStats.stringPropertyNames().forEach(key -> {
            Map<String, String> data = new HashMap<>(2);
            String property = commandStats.getProperty(key);
            data.put("name", StringUtils.removeStart(key, "cmdstat_"));
            data.put("value", StringUtils.substringBetween(property, "calls=", ",usec"));
            pieList.add(data);
        });
        result.put("commandStats", pieList);
        Map<String,Object> data = new HashMap<>();
        data.put("data",result);
        return R.ok(data);
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @GetMapping("/getNames")
    public R cache()
    {
        return R.ok(caches);
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @GetMapping("/getKeys/{cacheName}")
    public R getCacheKeys(@PathVariable String cacheName)
    {
        Set<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        return R.ok(new TreeSet<>(cacheKeys));
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @GetMapping("/getValue/{cacheName}/{cacheKey}")
    public R getCacheValue(@PathVariable String cacheName, @PathVariable String cacheKey)
    {
        String cacheValue = redisTemplate.opsForValue().get(cacheKey);
        SysCache sysCache = new SysCache(cacheName, cacheKey, cacheValue);
        return R.ok(sysCache);
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @DeleteMapping("/clearCacheName/{cacheName}")
    public R clearCacheName(@PathVariable String cacheName)
    {
        Collection<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        redisTemplate.delete(cacheKeys);
        return R.ok();
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @DeleteMapping("/clearCacheKey/{cacheKey}")
    public R clearCacheKey(@PathVariable String cacheKey)
    {
        redisTemplate.delete(cacheKey);
        return R.ok();
    }

    @PreAuthorize("@ss.hasPermi('monitor:cache:list')")
    @DeleteMapping("/clearCacheAll")
    public R clearCacheAll()
    {
        Collection<String> cacheKeys = redisTemplate.keys("*");
        redisTemplate.delete(cacheKeys);
        return R.ok();
    }
}
