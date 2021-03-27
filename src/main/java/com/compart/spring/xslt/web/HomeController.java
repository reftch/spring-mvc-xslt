package com.compart.spring.xslt.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    public static final String HOME = "home";
    public static final String CITIZENS = "citizens";

    @Autowired
    private ResourceLoader resourceLoader;

    @GetMapping("/")
    public String home(Model model) {
        Resource resource = loadXml(HOME);
        model.addAttribute(HOME, resource);
        return HOME;
    }

    @GetMapping("/citizens")
    public String xslt(Model model) {
        Resource resource = loadXml(CITIZENS);
        model.addAttribute(CITIZENS, resource);
        return CITIZENS;
    }

    private Resource loadXml(String name) {
        return resourceLoader.getResource("classpath:xml/" + name + ".xml");
    }


}
