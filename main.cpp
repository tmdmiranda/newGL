#include <cstdlib>
#include <iostream>
#include <ostream>
#define GLEW_STATIC
#include <GL/glew.h>
#define GLFW_USE_DWM_SWAP_INTERVAL
#include <GLFW/glfw3.h>

#include "LoadShaders.h"

void print_gl_info();
void print_error(int error, const char *description);
void init(void);
void display(void);

#define WIDTH 800
#define HEIGHT 600

const GLuint NumVertices = 6;

int main(void)
{
    GLFWwindow *window;

    glfwSetErrorCallback(print_error);

    if (!glfwInit()) return -1;

    window = glfwCreateWindow(WIDTH, HEIGHT, "GLSL", NULL, NULL);

    if (window == NULL)
    {
      glfwTerminate();
      return -1;
    }

    glfwMakeContextCurrent(window);

    glewExperimental = GL_TRUE;
    glewInit();

    print_gl_info();
    init();

    while (!glfwWindowShouldClose(window))
    {
      glClear(GL_COLOR_BUFFER_BIT);

      display();

      glfwSwapBuffers(window);

      glfwPollEvents();
    }

    glfwTerminate();
    return 0;
      
}


void print_gl_info() {
	GLint major, minor;
	glGetIntegerv(GL_MAJOR_VERSION, &major);
	glGetIntegerv(GL_MINOR_VERSION, &minor);
  std::cout << "\nOpenGL version " << major << '.' << minor << std::endl;

	const GLubyte *glversion = glGetString(GL_VERSION);
	const GLubyte *glvendor = glGetString(GL_VENDOR);
	const GLubyte *glrenderer = glGetString(GL_RENDERER);
  std::cout << "\nVersion:  " << glversion << std::endl << 
		    "Vendor:   " << glvendor << std::endl << 
		    "Renderer: " << glrenderer << std::endl;

  std::cout << "\nSupported GLSL versions:\n";
	const GLubyte *glslversion = glGetString(GL_SHADING_LANGUAGE_VERSION);
  std::cout << "Higher supported version:\n" << glslversion << std::endl;
	GLint numglslversions;
  std::cout << "Other supported versions:\n";
	glGetIntegerv(GL_NUM_SHADING_LANGUAGE_VERSIONS, &numglslversions);
	for (int n = 0; n < numglslversions; n++) {
    std::cout << glGetStringi(GL_SHADING_LANGUAGE_VERSION, n) << std::endl;
	}
}

void print_error(int error, const char *description)
{
  std::cout << description << std::endl;
}

void init(void)
{
 ShaderInfo shaders[] = {
   {GL_VERTEX_SHADER, "triangles.vert"},
   {GL_FRAGMENT_SHADER, "triangles.frag"},
   {GL_NONE, NULL}
 };

 GLuint programa = LoadShaders(shaders);

 if (!programa) exit(EXIT_FAILURE);
 glUseProgram(programa);
}

void display(void){
  static const float black[] = {
    0.0f, 0.0f, 0.0f, 0.0f
  };

  glClearBufferfv(GL_COLOR, 0, black);

  glDrawArrays(GL_TRIANGLES, 0, NumVertices);
}
