#include "FileOBJ.h"

#include <iostream>
#include <fstream>
#include <string>

#include <sstream>
#include <vector>

using namespace std;


void split(const string &s, char delim, vector<string> &elems) 
{
	stringstream ss(s);

	string item;

	while (getline(ss, item, delim)) {
		elems.push_back(item);
	}

}

float s2f ( const string& s )
{
	float tmp_val = 0;

	stringstream ss;
	ss << s;
	ss >> tmp_val;

	return tmp_val;	
}

int s2i ( const string& s )
{
	int tmp_val = 0;

	stringstream ss;
	ss << s;
	ss >> tmp_val;

	return tmp_val;	
}


cFileOBJ::cFileOBJ( const char* FileName )
{
	
	ifstream inputFile;
	inputFile.open( FileName, ios::in );
	
	//std::istream inputFile(std::basic_streambuf(FileName));

	cVertexList vertices1;

	int current_texture_num = 0;

	while( inputFile )
	{
		string str;
		getline(inputFile, str);
		
		vector<string> words;

		split( str, ' ', words );
			
		if ( words.size() > 1 )
		{
			
			
			// VERTICES
			if ( words[0] == "v" )
			{
				// todo few frames support
				if (words.size() == 4)
					//vertices1.push_back(Vertex3d( s2f(words[1]), 
					//                              -s2f(words[3]),
					//                              s2f(words[2]) ));
					vertices1.push_back(Vertex3d( s2f(words[1]), 
					                              s2f(words[2]),
					                              s2f(words[3]) ));
			}
			// TEXTURE VERTICES (UV)
			else if ( words[0] == "vt" )
			{
				if (words.size() == 3)
					textureUVs.push_back(TextureUV( (unsigned char)(s2f(words[1]) * 255) ,
					                                (unsigned char)(s2f(words[2]) * 255) ));
			}
			// VERTEX NORMALS (todo use normals, flip polygons)
			else if ( words[0] == "vn" )
			{
				if (words.size() == 4)
					normals.push_back(Vertex3d( s2f(words[1]), 
					                            s2f(words[2]),
					                            s2f(words[3]) ));
			}
			// MATERIAL NAME (TEXTURE NAME AND FLAGS)
			else if ( words[0] == "usemtl" )
			{
				// todo FLAGS PARSING
	
				if ( words.size() == 2 )
				{
					string preDotName = words[1];
					
					// we use pre dot name fragmet like a name of texture
					preDotName.erase( preDotName.find_last_of("."), preDotName.size() );
					
					// find this  name in array
					bool finded = false;
					int finded_texture_num = 0;

					for (int i = 0; i < textures.size() && !finded ; i++)
						if ( textures[i] == preDotName )
						{
							finded_texture_num = i;
							finded = true;
						}

					// ADD material pre dot name fragment to textures array					
					if ( !finded )
					{
						textures.push_back(preDotName+".pcx");
						current_texture_num = textures.size()-1;
						
						if (textures.size() > 10)
							cout <<endl <<"too many materials in model" <<endl;
					}
					else
						current_texture_num = finded_texture_num;
					// all polygon who stay after that "usemtl" will get his texture number in array
				}
			}
			// FACES 
			else if ( words[0] == "f" )
			{
				
				if ( words.size() == 4 )
				{
					ObjFace face;

					face.TextureNum = current_texture_num;
					face.Type = 0;

					// 1st point group
					{
						vector<string> point_info;
						split( words[1], '/', point_info );

						if ( point_info.size() == 3 )
						{
							face.V1 = s2i(point_info[0]);
							face.UV1 = s2i(point_info[1]);
							face.N1 = s2i(point_info[2]);
						}
					}
					
					// 2st point group
					{
						vector<string> point_info;
						split( words[2], '/', point_info );

						if ( point_info.size() == 3 )
						{
							face.V2 = s2i(point_info[0]);
							face.UV2 = s2i(point_info[1]);
							face.N2 = s2i(point_info[2]);
						}
					}

					// 3st point group
					{
						vector<string> point_info;
						split( words[3], '/', point_info );

						if ( point_info.size() == 3 )
						{
							face.V3 = s2i(point_info[0]);
							face.UV3 = s2i(point_info[1]);
							face.N3 = s2i(point_info[2]);
						}
					}

					faces.push_back(face);
				}
			}
		}
		

	}

	cout <<endl <<"vertices: " <<vertices1.size() 
		 <<endl <<"UV coords: "<<textureUVs.size()
		 <<endl <<"vertex normals: "<<normals.size()
		 <<endl <<"texture materials: "<<textures.size()
		 <<endl <<"faces: "<<faces.size()
		 <<endl;

	frames.push_back(vertices1);

	inputFile.close();





}

cFileOBJ::~cFileOBJ(void)
{
}


int cFileOBJ::GetNumFrames() const
{
	return frames.size();
}

int cFileOBJ::GetNumPolygons() const
{
	return 0;
}

int cFileOBJ::GetNumVertices() const
{
	return 0;
}