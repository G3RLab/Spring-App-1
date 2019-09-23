package nl.gplab.app.controller;

import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Controller
public class App1Controller {

    // inject via application.properties
    @Value("${welcome.message}")
    private String message;

    @GetMapping("/")
    public String root() {
        return "redirect:/welcome";
    }

    // /welcome?name=GPLab
    @GetMapping("/welcome")
    public String welcomeWithParam(@RequestParam(name = "name", required = false, defaultValue = "")
                                   String name, Model model) {
        model.addAttribute("message", Strings.isEmpty(name) ? message : name);
        return "welcome";
    }

}
